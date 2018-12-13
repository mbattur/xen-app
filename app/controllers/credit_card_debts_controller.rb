class CreditCardDebtsController < ApplicationController
  before_action :set_credit_card_debt, only: [:show, :edit, :update, :destroy]

  # GET /credit_card_debts
  # GET /credit_card_debts.json
  def index
    @credit_card_debts = CreditCardDebt.all
  end

  # GET /credit_card_debts/1
  # GET /credit_card_debts/1.json
  def show
  end

  # GET /credit_card_debts/new
  def new
    @credit_card_debt = CreditCardDebt.new
  end

  # GET /credit_card_debts/1/edit
  def edit
  end

  # POST /credit_card_debts
  # POST /credit_card_debts.json
  def create
    @credit_card_debt = CreditCardDebt.new(credit_card_debt_params)

    respond_to do |format|
      if @credit_card_debt.save
        format.html { redirect_to @credit_card_debt, notice: 'Credit card debt was successfully created.' }
        format.json { render :show, status: :created, location: @credit_card_debt }
      else
        format.html { render :new }
        format.json { render json: @credit_card_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_card_debts/1
  # PATCH/PUT /credit_card_debts/1.json
  def update
    respond_to do |format|
      if @credit_card_debt.update(credit_card_debt_params)
        format.html { redirect_to @credit_card_debt, notice: 'Credit card debt was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_card_debt }
      else
        format.html { render :edit }
        format.json { render json: @credit_card_debt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_debts/1
  # DELETE /credit_card_debts/1.json
  def destroy
    @credit_card_debt.destroy
    respond_to do |format|
      format.html { redirect_to credit_card_debts_url, notice: 'Credit card debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_debt
      @credit_card_debt = CreditCardDebt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_card_debt_params
      params.require(:credit_card_debt).permit(:card_name, :balance, :monthly_minimum)
    end
end
