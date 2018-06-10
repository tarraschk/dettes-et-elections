require 'test_helper'

class DonneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donnee = donnees(:one)
  end

  test "should get index" do
    get donnees_url
    assert_response :success
  end

  test "should get new" do
    get new_donnee_url
    assert_response :success
  end

  test "should create donnee" do
    assert_difference('Donnee.count') do
      post donnees_url, params: { donnee: { annee: @donnee.annee, avance_tresor: @donnee.avance_tresor, cap_autofinancement: @donnee.cap_autofinancement, cap_autofinancement_nette: @donnee.cap_autofinancement_nette, charges_achats: @donnee.charges_achats, charges_contingents: @donnee.charges_contingents, charges_financieres: @donnee.charges_financieres, charges_personnel: @donnee.charges_personnel, charges_subventions: @donnee.charges_subventions, charges_total: @donnee.charges_total, commune_id: @donnee.commune_id, compensation_relais_2010: @donnee.compensation_relais_2010, cotis_fonciere_entreprises: @donnee.cotis_fonciere_entreprises, cotis_fonciere_entreprises_base: @donnee.cotis_fonciere_entreprises_base, cotisation_valeur_ajoutee_entreprises: @donnee.cotisation_valeur_ajoutee_entreprises, dette_annuite: @donnee.dette_annuite, dette_encours_bancaire: @donnee.dette_encours_bancaire, dette_encours_total: @donnee.dette_encours_total, excedent_brut: @donnee.excedent_brut, fond_de_roulement: @donnee.fond_de_roulement, impot_forfait_entreprise_reseau: @donnee.impot_forfait_entreprise_reseau, invest_empl_charges: @donnee.invest_empl_charges, invest_empl_equipements: @donnee.invest_empl_equipements, invest_empl_immobilisations: @donnee.invest_empl_immobilisations, invest_empl_remboursement_emprunts: @donnee.invest_empl_remboursement_emprunts, invest_emplois_total: @donnee.invest_emplois_total, invest_ress_emprunts: @donnee.invest_ress_emprunts, invest_ress_fctva: @donnee.invest_ress_fctva, invest_ress_retours: @donnee.invest_ress_retours, invest_ress_subventions: @donnee.invest_ress_subventions, invest_ressources_total: @donnee.invest_ressources_total, population: @donnee.population, prod_autres_impots_taxes: @donnee.prod_autres_impots_taxes, prod_dotation: @donnee.prod_dotation, prod_impots_locaux: @donnee.prod_impots_locaux, produits_total: @donnee.produits_total, resultat_comptable: @donnee.resultat_comptable, taxe_add_non_bati: @donnee.taxe_add_non_bati, taxe_add_non_bati_base: @donnee.taxe_add_non_bati_base, taxe_foncier_bati: @donnee.taxe_foncier_bati, taxe_foncier_bati_base: @donnee.taxe_foncier_bati_base, taxe_habitation: @donnee.taxe_habitation, taxe_habitation_base: @donnee.taxe_habitation_base, taxe_non_bati: @donnee.taxe_non_bati, taxe_non_bati_base: @donnee.taxe_non_bati_base, taxe_professionnelle: @donnee.taxe_professionnelle, taxe_professionnelle_base: @donnee.taxe_professionnelle_base, taxe_surf_commerciales: @donnee.taxe_surf_commerciales } }
    end

    assert_redirected_to donnee_url(Donnee.last)
  end

  test "should show donnee" do
    get donnee_url(@donnee)
    assert_response :success
  end

  test "should get edit" do
    get edit_donnee_url(@donnee)
    assert_response :success
  end

  test "should update donnee" do
    patch donnee_url(@donnee), params: { donnee: { annee: @donnee.annee, avance_tresor: @donnee.avance_tresor, cap_autofinancement: @donnee.cap_autofinancement, cap_autofinancement_nette: @donnee.cap_autofinancement_nette, charges_achats: @donnee.charges_achats, charges_contingents: @donnee.charges_contingents, charges_financieres: @donnee.charges_financieres, charges_personnel: @donnee.charges_personnel, charges_subventions: @donnee.charges_subventions, charges_total: @donnee.charges_total, commune_id: @donnee.commune_id, compensation_relais_2010: @donnee.compensation_relais_2010, cotis_fonciere_entreprises: @donnee.cotis_fonciere_entreprises, cotis_fonciere_entreprises_base: @donnee.cotis_fonciere_entreprises_base, cotisation_valeur_ajoutee_entreprises: @donnee.cotisation_valeur_ajoutee_entreprises, dette_annuite: @donnee.dette_annuite, dette_encours_bancaire: @donnee.dette_encours_bancaire, dette_encours_total: @donnee.dette_encours_total, excedent_brut: @donnee.excedent_brut, fond_de_roulement: @donnee.fond_de_roulement, impot_forfait_entreprise_reseau: @donnee.impot_forfait_entreprise_reseau, invest_empl_charges: @donnee.invest_empl_charges, invest_empl_equipements: @donnee.invest_empl_equipements, invest_empl_immobilisations: @donnee.invest_empl_immobilisations, invest_empl_remboursement_emprunts: @donnee.invest_empl_remboursement_emprunts, invest_emplois_total: @donnee.invest_emplois_total, invest_ress_emprunts: @donnee.invest_ress_emprunts, invest_ress_fctva: @donnee.invest_ress_fctva, invest_ress_retours: @donnee.invest_ress_retours, invest_ress_subventions: @donnee.invest_ress_subventions, invest_ressources_total: @donnee.invest_ressources_total, population: @donnee.population, prod_autres_impots_taxes: @donnee.prod_autres_impots_taxes, prod_dotation: @donnee.prod_dotation, prod_impots_locaux: @donnee.prod_impots_locaux, produits_total: @donnee.produits_total, resultat_comptable: @donnee.resultat_comptable, taxe_add_non_bati: @donnee.taxe_add_non_bati, taxe_add_non_bati_base: @donnee.taxe_add_non_bati_base, taxe_foncier_bati: @donnee.taxe_foncier_bati, taxe_foncier_bati_base: @donnee.taxe_foncier_bati_base, taxe_habitation: @donnee.taxe_habitation, taxe_habitation_base: @donnee.taxe_habitation_base, taxe_non_bati: @donnee.taxe_non_bati, taxe_non_bati_base: @donnee.taxe_non_bati_base, taxe_professionnelle: @donnee.taxe_professionnelle, taxe_professionnelle_base: @donnee.taxe_professionnelle_base, taxe_surf_commerciales: @donnee.taxe_surf_commerciales } }
    assert_redirected_to donnee_url(@donnee)
  end

  test "should destroy donnee" do
    assert_difference('Donnee.count', -1) do
      delete donnee_url(@donnee)
    end

    assert_redirected_to donnees_url
  end
end
