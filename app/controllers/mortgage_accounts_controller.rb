class MortgageAccountsController < ApplicationController
  before_action :set_mortgage_account, only: [:show, :edit, :update, :destroy]

  # GET /mortgage_accounts
  # GET /mortgage_accounts.json
  def index
    @mortgage_accounts = MortgageAccount.all
  end

  # GET /mortgage_accounts/1
  # GET /mortgage_accounts/1.json
  def show
  end

  # GET /mortgage_accounts/new
  def new
    @mortgage_account = MortgageAccount.new
  end

  # GET /mortgage_accounts/1/edit
  def edit
  end

  # POST /mortgage_accounts
  # POST /mortgage_accounts.json
  def create
    @mortgage_account = MortgageAccount.new(mortgage_account_params)

    respond_to do |format|
      if @mortgage_account.save
        format.html { redirect_to @mortgage_account, notice: 'Mortgage account was successfully created.' }
        format.json { render :show, status: :created, location: @mortgage_account }
      else
        format.html { render :new }
        format.json { render json: @mortgage_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mortgage_accounts/1
  # PATCH/PUT /mortgage_accounts/1.json
  def update
    respond_to do |format|
      if @mortgage_account.update(mortgage_account_params)
        format.html { redirect_to @mortgage_account, notice: 'Mortgage account was successfully updated.' }
        format.json { render :show, status: :ok, location: @mortgage_account }
      else
        format.html { render :edit }
        format.json { render json: @mortgage_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mortgage_accounts/1
  # DELETE /mortgage_accounts/1.json
  def destroy
    @mortgage_account.destroy
    respond_to do |format|
      format.html { redirect_to mortgage_accounts_url, notice: 'Mortgage account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mortgage_account
      @mortgage_account = MortgageAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mortgage_account_params
      params.require(:mortgage_account).permit(:balance)
    end
end
