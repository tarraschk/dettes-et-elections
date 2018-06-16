require 'json'

namespace :export do
  desc "Export communes contour"
  task communes: :environment do
    communes = Commune.all.where.not(geo_contour:nil)

    res = {
        type: 'FeatureCollection',
        features: []
    }
    communes.each do |commune|
      res[:features].push({
          type: 'Feature',
          geometry: JSON.parse(commune.geo_centre.gsub('=>', ':')),
          properties: {
              name: commune.commune,
              depcom: commune.depcom,
              dep: commune.dep
          }
      })
    end

    File.open('public/communes.geojson', 'w') { |file| file.write(res.to_json) }

  end

  desc "Export communes data for given year"
  task donnees: :environment do

    annees = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016]

    annees.each do |annee|

      puts "Exporting #{annee.to_s}..."

      donnees = Donnee.where(annee: annee).joins(:commune).where.not('communes.geo_centre': nil)

      res = {
          type: 'FeatureCollection',
          features: []
      }
      donnees.each do |donnee|
        res[:features].push({
                                type: 'Feature',
                                geometry: JSON.parse(donnee.commune.geo_centre.gsub('=>', ':')),
                                properties: {
                                    name: donnee.commune.commune,
                                    excedent: donnee.produits_total.to_f - donnee.charges_total.to_f,
                                    excedent_pct: (((donnee.produits_total.to_f - donnee.charges_total.to_f) / donnee.produits_total.to_f)*100).round(2),
                                    depcom: donnee.commune.depcom,
                                    dep: donnee.commune.dep,
                                    description: [
                                        '<strong>',
                                        donnee.commune.commune + ' - ' + annee.to_s,
                                        '</strong>',
                                        '<p>Produits : ',
                                        donnee.produits_total.to_s,
                                        'k€</p>',
                                        '<p>Charges : ',
                                        donnee.charges_total.to_s,
                                        'k€</p>',
                                        '<p>Dette : ',
                                        donnee.dette_encours_total.to_s,
                                        'k€</p>',
                                        '<p>Dette %prod : ',
                                        ((donnee.dette_encours_total.to_f / donnee.produits_total.to_f)*100).round(2).to_s,
                                        '%</p>',
                                        '<p>Excédent : ',
                                        (donnee.produits_total - donnee.charges_total).to_s,
                                        'k€</p>',
                                        '<p>Excédent %prod : ',
                                        (((donnee.produits_total.to_f - donnee.charges_total.to_f) / donnee.produits_total.to_f)*100).round(2),
                                        '%</p>'
                                    ].join(),
                                    dette_pct: ((donnee.dette_encours_total.to_f / donnee.produits_total.to_f)*100).round(2),
                                    total_dette: donnee.dette_encours_total.to_f,
                                    total_produits: donnee.produits_total.to_f
                                }
                            })
      end

      File.open('public/donnees_' + annee.to_s + '.geojson', 'w') { |file| file.write(res.to_json) }


    end

    puts "Done."
  end
end
