class BigEmergenciesController < ApplicationController
  before_action :set_big_emergency, only: [:show, :edit, :update, :destroy]

  # GET /big_emergencies
  # GET /big_emergencies.json
  def index
    @big_emergencies = BigEmergency.all
  end

  # GET /big_emergencies/1
  # GET /big_emergencies/1.json
  def show
  end

  # GET /big_emergencies/new
  def new
    @big_emergency = BigEmergency.new
  end

  # GET /big_emergencies/1/edit
  def edit
  end

  # POST /big_emergencies
  # POST /big_emergencies.json
  def create
    @big_emergency = BigEmergency.new(big_emergency_params)

    respond_to do |format|
      if @big_emergency.save
        format.html { redirect_to @big_emergency, notice: 'Big emergency was successfully created.' }
        format.json { render :show, status: :created, location: @big_emergency }
      else
        format.html { render :new }
        format.json { render json: @big_emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /big_emergencies/1
  # PATCH/PUT /big_emergencies/1.json
  def update
    respond_to do |format|
      if @big_emergency.update(big_emergency_params)
        format.html { redirect_to @big_emergency, notice: 'Big emergency was successfully updated.' }
        format.json { render :show, status: :ok, location: @big_emergency }
      else
        format.html { render :edit }
        format.json { render json: @big_emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /big_emergencies/1
  # DELETE /big_emergencies/1.json
  def destroy
    @big_emergency.destroy
    respond_to do |format|
      format.html { redirect_to big_emergencies_url, notice: 'Big emergency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_big_emergency
      @big_emergency = BigEmergency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def big_emergency_params
      params.require(:big_emergency).permit(:balance)
    end
end
