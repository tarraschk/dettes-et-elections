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
    donnees = Donnee.where(annee: 2010).joins(:commune).where.not('communes.geo_centre': nil)

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
                                  depcom: donnee.commune.depcom,
                                  dep: donnee.commune.dep,
                                  description: [
                                      '<strong>',
                                      donnee.commune.commune,
                                      '</strong>',
                                      '<p>Produits : ',
                                      donnee.produits_total.to_s,
                                      'k€</p>',
                                      '<p>Dette : ',
                                      donnee.dette_encours_total.to_s,
                                      'k€</p>',
                                      '<p>Ratio : ',
                                      ((donnee.dette_encours_total.to_f / donnee.produits_total.to_f)*100).round(2).to_s,
                                  ].join(),
                                  dette_pct: ((donnee.dette_encours_total.to_f / donnee.produits_total.to_f)*100).round(2),
                                  total_dette: donnee.dette_encours_total.to_f,
                                  total_produits: donnee.produits_total.to_f
                              }
                          })
    end

    File.open('public/donnees_2010.geojson', 'w') { |file| file.write(res.to_json) }
  end
end
