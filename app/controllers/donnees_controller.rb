class DonneesController < ApplicationController
  before_action :set_donnee, only: [:show, :edit, :update, :destroy]

  # GET /donnees
  # GET /donnees.json
  def index
    @donnees = Donnee.all
  end

  # GET /donnees/1
  # GET /donnees/1.json
  def show
  end

  # GET /donnees/new
  def new
    @donnee = Donnee.new
  end

  # GET /donnees/1/edit
  def edit
  end

  # POST /donnees
  # POST /donnees.json
  def create
    @donnee = Donnee.new(donnee_params)

    respond_to do |format|
      if @donnee.save
        format.html { redirect_to @donnee, notice: 'Donnee was successfully created.' }
        format.json { render :show, status: :created, location: @donnee }
      else
        format.html { render :new }
        format.json { render json: @donnee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donnees/1
  # PATCH/PUT /donnees/1.json
  def update
    respond_to do |format|
      if @donnee.update(donnee_params)
        format.html { redirect_to @donnee, notice: 'Donnee was successfully updated.' }
        format.json { render :show, status: :ok, location: @donnee }
      else
        format.html { render :edit }
        format.json { render json: @donnee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donnees/1
  # DELETE /donnees/1.json
  def destroy
    @donnee.destroy
    respond_to do |format|
      format.html { redirect_to donnees_url, notice: 'Donnee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donnee
      @donnee = Donnee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donnee_params
      params.require(:donnee).permit(:annee, :population, :produits_total, :prod_impots_locaux, :prod_autres_impots_taxes, :prod_dotation, :charges_total, :charges_personnel, :charges_achats, :charges_financieres, :charges_contingents, :charges_subventions, :resultat_comptable, :invest_ressources_total, :invest_ress_emprunts, :invest_ress_subventions, :invest_ress_fctva, :invest_ress_retours, :invest_emplois_total, :invest_empl_equipements, :invest_empl_remboursement_emprunts, :invest_empl_charges, :invest_empl_immobilisations, :excedent_brut, :cap_autofinancement, :cap_autofinancement_nette, :dette_encours_total, :dette_encours_bancaire, :avance_tresor, :dette_annuite, :fond_de_roulement, :taxe_habitation, :taxe_habitation_base, :taxe_foncier_bati, :taxe_foncier_bati_base, :taxe_non_bati, :taxe_non_bati_base, :taxe_add_non_bati, :taxe_add_non_bati_base, :cotis_fonciere_entreprises, :cotis_fonciere_entreprises_base, :cotisation_valeur_ajoutee_entreprises, :impot_forfait_entreprise_reseau, :taxe_surf_commerciales, :compensation_relais_2010, :taxe_professionnelle, :taxe_professionnelle_base, :commune_id)
    end
end
