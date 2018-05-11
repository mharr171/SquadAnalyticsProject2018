class SquadDataController < ApplicationController
  before_action :set_squad_datum, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /squad_data
  # GET /squad_data.json
  def index
    @squad_data = SquadDatum.all.where(user_id: current_user.id)
  end

  # GET /squad_data/1
  # GET /squad_data/1.json
  def show
  end

  # GET /squad_data/new
  def new
    @squad_datum = SquadDatum.new
    @user = current_user
  end

  # GET /squad_data/1/edit
  def edit
  end

  # POST /squad_data
  # POST /squad_data.json
  def create
    @squad_datum = SquadDatum.new(squad_datum_params)

    respond_to do |format|
      if @squad_datum.save
        format.html { redirect_to @squad_datum, notice: 'Squad datum was successfully created.' }
        format.json { render :show, status: :created, location: @squad_datum }
      else
        format.html { render :new }
        format.json { render json: @squad_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squad_data/1
  # PATCH/PUT /squad_data/1.json
  def update
    respond_to do |format|
      if @squad_datum.update(squad_datum_params)
        format.html { redirect_to @squad_datum, notice: 'Squad datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @squad_datum }
      else
        format.html { render :edit }
        format.json { render json: @squad_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squad_data/1
  # DELETE /squad_data/1.json
  def destroy
    @squad_datum.destroy
    respond_to do |format|
      format.html { redirect_to squad_data_url, notice: 'Squad datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squad_datum
      @squad_datum = SquadDatum.find(params[:id])
    end

    def set_user
      @user = User.find(@squad_datum.user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squad_datum_params
      params.require(:squad_datum).permit(:load_squad_data, :update_squad_data, :user_id)
    end
end
