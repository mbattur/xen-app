class SmallEmergenciesController < ApplicationController
  before_action :set_small_emergency, only: [:show, :edit, :update, :destroy]

  # GET /small_emergencies
  # GET /small_emergencies.json
  def index
    @small_emergencies = SmallEmergency.all
  end

  # GET /small_emergencies/1
  # GET /small_emergencies/1.json
  def show
  end

  # GET /small_emergencies/new
  def new
    @small_emergency = SmallEmergency.new
  end

  # GET /small_emergencies/1/edit
  def edit
  end

  # POST /small_emergencies
  # POST /small_emergencies.json
  def create
    @small_emergency = SmallEmergency.new(small_emergency_params)

    respond_to do |format|
      if @small_emergency.save
        format.html { redirect_to @small_emergency, notice: 'Small emergency was successfully created.' }
        format.json { render :show, status: :created, location: @small_emergency }
      else
        format.html { render :new }
        format.json { render json: @small_emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /small_emergencies/1
  # PATCH/PUT /small_emergencies/1.json
  def update
    respond_to do |format|
      if @small_emergency.update(small_emergency_params)
        format.html { redirect_to @small_emergency, notice: 'Small emergency was successfully updated.' }
        format.json { render :show, status: :ok, location: @small_emergency }
      else
        format.html { render :edit }
        format.json { render json: @small_emergency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /small_emergencies/1
  # DELETE /small_emergencies/1.json
  def destroy
    @small_emergency.destroy
    respond_to do |format|
      format.html { redirect_to small_emergencies_url, notice: 'Small emergency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_small_emergency
      @small_emergency = SmallEmergency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def small_emergency_params
      params.require(:small_emergency).permit(:balance)
    end
end
