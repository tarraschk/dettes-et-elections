require "application_system_test_case"

class DonneesTest < ApplicationSystemTestCase
  setup do
    @donnee = donnees(:one)
  end

  test "visiting the index" do
    visit donnees_url
    assert_selector "h1", text: "Donnees"
  end

  test "creating a Donnee" do
    visit donnees_url
    click_on "New Donnee"

    fill_in "Annee", with: @donnee.annee
    fill_in "Avance Tresor", with: @donnee.avance_tresor
    fill_in "Cap Autofinancement", with: @donnee.cap_autofinancement
    fill_in "Cap Autofinancement Nette", with: @donnee.cap_autofinancement_nette
    fill_in "Charges Achats", with: @donnee.charges_achats
    fill_in "Charges Contingents", with: @donnee.charges_contingents
    fill_in "Charges Financieres", with: @donnee.charges_financieres
    fill_in "Charges Personnel", with: @donnee.charges_personnel
    fill_in "Charges Subventions", with: @donnee.charges_subventions
    fill_in "Charges Total", with: @donnee.charges_total
    fill_in "Commune", with: @donnee.commune_id
    fill_in "Compensation Relais 2010", with: @donnee.compensation_relais_2010
    fill_in "Cotis Fonciere Entreprises", with: @donnee.cotis_fonciere_entreprises
    fill_in "Cotis Fonciere Entreprises Base", with: @donnee.cotis_fonciere_entreprises_base
    fill_in "Cotisation Valeur Ajoutee Entreprises", with: @donnee.cotisation_valeur_ajoutee_entreprises
    fill_in "Dette Annuite", with: @donnee.dette_annuite
    fill_in "Dette Encours Bancaire", with: @donnee.dette_encours_bancaire
    fill_in "Dette Encours Total", with: @donnee.dette_encours_total
    fill_in "Excedent Brut", with: @donnee.excedent_brut
    fill_in "Fond De Roulement", with: @donnee.fond_de_roulement
    fill_in "Impot Forfait Entreprise Reseau", with: @donnee.impot_forfait_entreprise_reseau
    fill_in "Invest Empl Charges", with: @donnee.invest_empl_charges
    fill_in "Invest Empl Equipements", with: @donnee.invest_empl_equipements
    fill_in "Invest Empl Immobilisations", with: @donnee.invest_empl_immobilisations
    fill_in "Invest Empl Remboursement Emprunts", with: @donnee.invest_empl_remboursement_emprunts
    fill_in "Invest Emplois Total", with: @donnee.invest_emplois_total
    fill_in "Invest Ress Emprunts", with: @donnee.invest_ress_emprunts
    fill_in "Invest Ress Fctva", with: @donnee.invest_ress_fctva
    fill_in "Invest Ress Retours", with: @donnee.invest_ress_retours
    fill_in "Invest Ress Subventions", with: @donnee.invest_ress_subventions
    fill_in "Invest Ressources Total", with: @donnee.invest_ressources_total
    fill_in "Population", with: @donnee.population
    fill_in "Prod Autres Impots Taxes", with: @donnee.prod_autres_impots_taxes
    fill_in "Prod Dotation", with: @donnee.prod_dotation
    fill_in "Prod Impots Locaux", with: @donnee.prod_impots_locaux
    fill_in "Produits Total", with: @donnee.produits_total
    fill_in "Resultat Comptable", with: @donnee.resultat_comptable
    fill_in "Taxe Add Non Bati", with: @donnee.taxe_add_non_bati
    fill_in "Taxe Add Non Bati Base", with: @donnee.taxe_add_non_bati_base
    fill_in "Taxe Foncier Bati", with: @donnee.taxe_foncier_bati
    fill_in "Taxe Foncier Bati Base", with: @donnee.taxe_foncier_bati_base
    fill_in "Taxe Habitation", with: @donnee.taxe_habitation
    fill_in "Taxe Habitation Base", with: @donnee.taxe_habitation_base
    fill_in "Taxe Non Bati", with: @donnee.taxe_non_bati
    fill_in "Taxe Non Bati Base", with: @donnee.taxe_non_bati_base
    fill_in "Taxe Professionnelle", with: @donnee.taxe_professionnelle
    fill_in "Taxe Professionnelle Base", with: @donnee.taxe_professionnelle_base
    fill_in "Taxe Surf Commerciales", with: @donnee.taxe_surf_commerciales
    click_on "Create Donnee"

    assert_text "Donnee was successfully created"
    click_on "Back"
  end

  test "updating a Donnee" do
    visit donnees_url
    click_on "Edit", match: :first

    fill_in "Annee", with: @donnee.annee
    fill_in "Avance Tresor", with: @donnee.avance_tresor
    fill_in "Cap Autofinancement", with: @donnee.cap_autofinancement
    fill_in "Cap Autofinancement Nette", with: @donnee.cap_autofinancement_nette
    fill_in "Charges Achats", with: @donnee.charges_achats
    fill_in "Charges Contingents", with: @donnee.charges_contingents
    fill_in "Charges Financieres", with: @donnee.charges_financieres
    fill_in "Charges Personnel", with: @donnee.charges_personnel
    fill_in "Charges Subventions", with: @donnee.charges_subventions
    fill_in "Charges Total", with: @donnee.charges_total
    fill_in "Commune", with: @donnee.commune_id
    fill_in "Compensation Relais 2010", with: @donnee.compensation_relais_2010
    fill_in "Cotis Fonciere Entreprises", with: @donnee.cotis_fonciere_entreprises
    fill_in "Cotis Fonciere Entreprises Base", with: @donnee.cotis_fonciere_entreprises_base
    fill_in "Cotisation Valeur Ajoutee Entreprises", with: @donnee.cotisation_valeur_ajoutee_entreprises
    fill_in "Dette Annuite", with: @donnee.dette_annuite
    fill_in "Dette Encours Bancaire", with: @donnee.dette_encours_bancaire
    fill_in "Dette Encours Total", with: @donnee.dette_encours_total
    fill_in "Excedent Brut", with: @donnee.excedent_brut
    fill_in "Fond De Roulement", with: @donnee.fond_de_roulement
    fill_in "Impot Forfait Entreprise Reseau", with: @donnee.impot_forfait_entreprise_reseau
    fill_in "Invest Empl Charges", with: @donnee.invest_empl_charges
    fill_in "Invest Empl Equipements", with: @donnee.invest_empl_equipements
    fill_in "Invest Empl Immobilisations", with: @donnee.invest_empl_immobilisations
    fill_in "Invest Empl Remboursement Emprunts", with: @donnee.invest_empl_remboursement_emprunts
    fill_in "Invest Emplois Total", with: @donnee.invest_emplois_total
    fill_in "Invest Ress Emprunts", with: @donnee.invest_ress_emprunts
    fill_in "Invest Ress Fctva", with: @donnee.invest_ress_fctva
    fill_in "Invest Ress Retours", with: @donnee.invest_ress_retours
    fill_in "Invest Ress Subventions", with: @donnee.invest_ress_subventions
    fill_in "Invest Ressources Total", with: @donnee.invest_ressources_total
    fill_in "Population", with: @donnee.population
    fill_in "Prod Autres Impots Taxes", with: @donnee.prod_autres_impots_taxes
    fill_in "Prod Dotation", with: @donnee.prod_dotation
    fill_in "Prod Impots Locaux", with: @donnee.prod_impots_locaux
    fill_in "Produits Total", with: @donnee.produits_total
    fill_in "Resultat Comptable", with: @donnee.resultat_comptable
    fill_in "Taxe Add Non Bati", with: @donnee.taxe_add_non_bati
    fill_in "Taxe Add Non Bati Base", with: @donnee.taxe_add_non_bati_base
    fill_in "Taxe Foncier Bati", with: @donnee.taxe_foncier_bati
    fill_in "Taxe Foncier Bati Base", with: @donnee.taxe_foncier_bati_base
    fill_in "Taxe Habitation", with: @donnee.taxe_habitation
    fill_in "Taxe Habitation Base", with: @donnee.taxe_habitation_base
    fill_in "Taxe Non Bati", with: @donnee.taxe_non_bati
    fill_in "Taxe Non Bati Base", with: @donnee.taxe_non_bati_base
    fill_in "Taxe Professionnelle", with: @donnee.taxe_professionnelle
    fill_in "Taxe Professionnelle Base", with: @donnee.taxe_professionnelle_base
    fill_in "Taxe Surf Commerciales", with: @donnee.taxe_surf_commerciales
    click_on "Update Donnee"

    assert_text "Donnee was successfully updated"
    click_on "Back"
  end

  test "destroying a Donnee" do
    visit donnees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Donnee was successfully destroyed"
  end
end
