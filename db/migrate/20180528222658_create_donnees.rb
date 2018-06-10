class CreateDonnees < ActiveRecord::Migration[5.2]
  def change
    create_table :donnees do |t|
      t.integer :annee
      t.integer :population
      t.integer :produits_total
      t.integer :prod_impots_locaux
      t.integer :prod_autres_impots_taxes
      t.integer :prod_dotation
      t.integer :charges_total
      t.integer :charges_personnel
      t.integer :charges_achats
      t.integer :charges_financieres
      t.integer :charges_contingents
      t.integer :charges_subventions
      t.integer :resultat_comptable
      t.integer :invest_ressources_total
      t.integer :invest_ress_emprunts
      t.integer :invest_ress_subventions
      t.integer :invest_ress_fctva
      t.integer :invest_ress_retours
      t.integer :invest_emplois_total
      t.integer :invest_empl_equipements
      t.integer :invest_empl_remboursement_emprunts
      t.integer :invest_empl_charges
      t.integer :invest_empl_immobilisations
      t.integer :excedent_brut
      t.integer :cap_autofinancement
      t.integer :cap_autofinancement_nette
      t.integer :dette_encours_total
      t.integer :dette_encours_bancaire
      t.integer :avance_tresor
      t.integer :dette_annuite
      t.integer :fond_de_roulement
      t.integer :taxe_habitation
      t.integer :taxe_habitation_base
      t.integer :taxe_foncier_bati
      t.integer :taxe_foncier_bati_base
      t.integer :taxe_non_bati
      t.integer :taxe_non_bati_base
      t.integer :taxe_add_non_bati
      t.integer :taxe_add_non_bati_base
      t.integer :cotis_fonciere_entreprises
      t.integer :cotis_fonciere_entreprises_base
      t.integer :cotisation_valeur_ajoutee_entreprises
      t.integer :impot_forfait_entreprise_reseau
      t.integer :taxe_surf_commerciales
      t.integer :compensation_relais_2010
      t.integer :taxe_professionnelle
      t.integer :taxe_professionnelle_base
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
