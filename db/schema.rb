# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_03_215944) do

  create_table "communes", force: :cascade do |t|
    t.string "dep"
    t.string "depcom"
    t.string "commune"
    t.string "geo_centre"
    t.integer "geo_surface"
    t.string "geo_contour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
  end

  create_table "donnees", force: :cascade do |t|
    t.integer "annee"
    t.integer "population"
    t.integer "produits_total"
    t.integer "prod_impots_locaux"
    t.integer "prod_autres_impots_taxes"
    t.integer "prod_dotation"
    t.integer "charges_total"
    t.integer "charges_personnel"
    t.integer "charges_achats"
    t.integer "charges_financieres"
    t.integer "charges_contingents"
    t.integer "charges_subventions"
    t.integer "resultat_comptable"
    t.integer "invest_ressources_total"
    t.integer "invest_ress_emprunts"
    t.integer "invest_ress_subventions"
    t.integer "invest_ress_fctva"
    t.integer "invest_ress_retours"
    t.integer "invest_emplois_total"
    t.integer "invest_empl_equipements"
    t.integer "invest_empl_remboursement_emprunts"
    t.integer "invest_empl_charges"
    t.integer "invest_empl_immobilisations"
    t.integer "excedent_brut"
    t.integer "cap_autofinancement"
    t.integer "cap_autofinancement_nette"
    t.integer "dette_encours_total"
    t.integer "dette_encours_bancaire"
    t.integer "avance_tresor"
    t.integer "dette_annuite"
    t.integer "fond_de_roulement"
    t.integer "taxe_habitation"
    t.integer "taxe_habitation_base"
    t.integer "taxe_foncier_bati"
    t.integer "taxe_foncier_bati_base"
    t.integer "taxe_non_bati"
    t.integer "taxe_non_bati_base"
    t.integer "taxe_add_non_bati"
    t.integer "taxe_add_non_bati_base"
    t.integer "cotis_fonciere_entreprises"
    t.integer "cotis_fonciere_entreprises_base"
    t.integer "cotisation_valeur_ajoutee_entreprises"
    t.integer "impot_forfait_entreprise_reseau"
    t.integer "taxe_surf_commerciales"
    t.integer "compensation_relais_2010"
    t.integer "taxe_professionnelle"
    t.integer "taxe_professionnelle_base"
    t.integer "commune_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_donnees_on_commune_id"
  end

end
