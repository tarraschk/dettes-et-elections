require 'csv'
require 'net/http'
require 'json'
require 'nokogiri'

namespace :import do
  desc "Import communes data from DGFip"
  task communes: :environment do
    p "Importing..."
    i = 0
    keys = Commune.column_names.without("id", "created_at", "updated_at").map(&:to_sym)
    res = {}
    # requires the 'tr' command of https://unix.stackexchange.com/questions/338524/how-to-remove-the-double-quotes-in-a-csv
    CSV.foreach('vendor/comptes_communes_2000-2016.csv',
                headers: true,
                header_converters: :symbol,
                :quote_char=>'"',
                :col_sep =>","
    ) do |row|

      hash = {}
      keys.each do |k|
        hash[k] = row[k]
      end

      res[hash[:depcom]] = hash unless hash[:depcom].nil?

      i = i + 1
      p i if i % 1000 == 0
    end

    Commune.create(res.values)

    p "Done."
  end

  desc "Import communes financial data from DGFip"
  task donnees: :environment do
    p "Importing..."
    i = 0
    keys = Donnee.column_names.without("id", "created_at", "updated_at").map(&:to_sym)
    res = {}
    # requires the 'tr' command of https://unix.stackexchange.com/questions/338524/how-to-remove-the-double-quotes-in-a-csv
    CSV.foreach('vendor/comptes_communes_2000-2016.csv',
                headers: true,
                header_converters: :symbol,
                :quote_char=>'"',
                :col_sep =>","
    ) do |row|

      hash = {}
      keys.each do |k|
        hash[k] = row[k]
      end

      if !row[:depcom].nil?
        res[row[:depcom]] = [] unless res.has_key? row[:depcom]
        res[row[:depcom]].push(hash)
      end

      i = i + 1
      p i if i % 1000 == 0
    end

    res.keys.each do |key|
      p key.to_s
      Commune.find_by(depcom: key).donnees = Donnee.create(res[key])
    end

    p "Done."
  end

  desc "Enhance communes data with geo api"
  task geos: :environment do
    p "Importing..."

    Commune.where(is_active: true).each do |commune|
      url = "https://geo.api.gouv.fr/communes/#{commune.depcom}?fields=centre,surface,contour&format=json"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      #p url
      if res.code == "200"
        r = JSON.parse(res.body)
        commune.update(geo_centre: r["centre"], geo_contour: r["contour"], geo_surface: r["surface"])
      else
        p "ERREUR pour #{commune.depcom} ! - #{res.body}"
        commune.update(is_active: false)
      end
    end

    p "Done."
  end

  desc "Importing unemployment data"
  task chomage: :environment do
    p "Importing..."

    depcoms = Commune.where(is_active: true).select(:depcom).distinct(:depcom).pluck(:depcom).sort[29375..-1]

    Commune.where(depcom: depcoms).each do |commune|
      depcom = commune.depcom

      url = "https://ville-data.com/chomage/X-00-#{depcom}"
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      p url
      if res.code == "200"
        r = res.body.scan(/boutique\/reuse\/[0-9]+/)
        if r.length > 0
          codecommune = r.first.split('/').last

          url = "https://ville-data.com/chomage/boutique/reuse/#{codecommune}"
          uri = URI(url)
          res = Net::HTTP.get_response(uri)

          if res.code == "200"
            r = JSON.parse(res.body)

            resultat = []

            r["rows"].each do |row|
              data = row["c"]
              annee = data.first["v"].to_i #annee
              taux = data.second["v"] #taux

              resultat.push({year: annee, taux: taux.round(0)})
            end

            commune.chomages = Chomage.create(resultat)
          else
            p "PAS REUSSI A RECUPERER DONNEES pour #{depcom} ! - #{codecommune}"
          end
        end
      else
        p "ERREUR pour #{depcom} !"
      end
    end
  end

  desc "Importing resultats 2014 municipales"
  task muni2014: :environment do
    data = CSV.read('vendor/muni2014final.csv')
    data.each do |x|
      Commune.find_by(depcom: x[0])&.update(parti_2014: x[2])
    end
  end

end
