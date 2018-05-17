class FeedbackController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedback
  # GET /feedback.json
  def index
    @feedback = Feedback.all
  end

  # GET /feedback/1
  # GET /feedback/1.json
  def show
  end

  # GET /feedback/new
  def new
    @feedback = Feedback.new
    @user = current_user
  end

  # GET /feedback/1/edit
  def edit
  end

  # POST /feedback
  # POST /feedback.json
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback/1
  # PATCH/PUT /feedback/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback/1
  # DELETE /feedback/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedback_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:data)
    end
end
