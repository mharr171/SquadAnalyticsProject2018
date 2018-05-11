class SquadDnasController < ApplicationController
  before_action :set_squad_dna, only: [:show, :edit, :update, :destroy]

  # GET /squad_dnas
  # GET /squad_dnas.json
  def index
    # @squad_dnas = SquadDna.all
    @squad = Squad.find(params[:squad_id])
    @squad_dnas = SquadDna.where(squad_id: @squad.id)
  end

  # GET /squad_dnas/1
  # GET /squad_dnas/1.json
  def show
    @squad = Squad.find(SquadDna.find(params[:id]).squad_id)
  end

  # GET /squad_dnas/new
  def new
    @squad_dna = SquadDna.new
    @squad = Squad.find(params[:squad_id])
  end

  # GET /squad_dnas/1/edit
  def edit
    @squad = Squad.find(params[:squad_id])
  end

  # POST /squad_dnas
  # POST /squad_dnas.json
  def create
    @squad_dna = SquadDna.new(squad_dna_params)

    respond_to do |format|
      if @squad_dna.save
        format.html { redirect_to @squad_dna, notice: 'Squad dna was successfully created.' }
        format.json { render :show, status: :created, location: @squad_dna }
      else
        format.html { render :new }
        format.json { render json: @squad_dna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squad_dnas/1
  # PATCH/PUT /squad_dnas/1.json
  def update
    respond_to do |format|
      if @squad_dna.update(squad_dna_params)
        format.html { redirect_to @squad_dna, notice: 'Squad dna was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad_dna }
      else
        format.html { render :edit }
        format.json { render json: @squad_dna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squad_dnas/1
  # DELETE /squad_dnas/1.json
  def destroy
    @squad_dna.destroy
    respond_to do |format|
      format.html { redirect_to squad_squad_dnas_url(params[:squad_id]), notice: 'Squad dna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad_dna
      @squad_dna = SquadDna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squad_dna_params
      params.require(:squad_dna).permit(:squad_id, :cor_m, :cro_m, :dri_m, :fin_m, :fir_m, :fre_m, :hea_m, :lon_m, :lth_m, :mar_m, :pas_m, :pen_m, :tck_m, :tec_m, :agg_m, :ant_m, :bra_m, :cmp_m, :cnt_m, :dec_m, :det_m, :fla_m, :ldr_m, :otb_m, :pos_m, :tea_m, :vis_m, :wor_m, :acc_m, :agi_m, :bal_m, :jum_m, :nat_m, :pac_m, :sta_m, :str_m, :aer_m, :cmd_m, :com_m, :ecc_m, :han_m, :kic_m, :onevone_m, :ref_m, :rus_m, :pun_m, :thr_m, :key_g_mis_h, :key_shp_h, :fir_g_mis_h, :fir_shp_h, :rot_g_mis_h, :rot_shp_h, :bac_g_mis_h, :bac_shp_h, :hot_g_mis_h, :hot_shp_h, :you_g_mis_h, :you_shp_h, :low_ris_h, :nor_ris_h, :inc_ris_h, :hig_ris_h, :ver_ris_h)
    end
end
