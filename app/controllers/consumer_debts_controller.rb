class ConsumerDebtsController < ApplicationController
  before_action :set_consumer_debt, only: [:show, :edit, :update, :destroy]

  # GET /consumer_debts
  # GET /consumer_debts.json
  def index
    @consumer_debts = ConsumerDebt.all
  end

  # GET /consumer_debts/1
  # GET /consumer_debts/1.json
  def show
  end

  # GET /consumer_debts/new
  def new
    @consumer_debt = ConsumerDebt.new
  end

  # GET /consumer_debts/1/edit
  def edit
  end

  # POST /consumer_debts
  # POST /consumer_debts.json
  def create
    @consumer_debt = ConsumerDebt.new(consumer_debt_params)

    respond_to do |format|
      if @consumer_debt.save
        format.html { redirect_to @consumer_debt, notice: 'Consumer debt was successfully created.' }
        format.json { render :show, status: :created, location: @consumer_debt }
      else
        format.html { render :new }
        format.json { render json: @consumer_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumer_debts/1
  # PATCH/PUT /consumer_debts/1.json
  def update
    respond_to do |format|
      if @consumer_debt.update(consumer_debt_params)
        format.html { redirect_to @consumer_debt, notice: 'Consumer debt was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumer_debt }
      else
        format.html { render :edit }
        format.json { render json: @consumer_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_debts/1
  # DELETE /consumer_debts/1.json
  def destroy
    @consumer_debt.destroy
    respond_to do |format|
      format.html { redirect_to consumer_debts_url, notice: 'Consumer debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer_debt
      @consumer_debt = ConsumerDebt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumer_debt_params
      params.require(:consumer_debt).permit(
        :name, :balance, :account_number, :monthly_minimum, :payee_name, 
        :payee_address1, :payee_address2, :payee_city, :payee_state, :payee_zip
      )
    end
end
