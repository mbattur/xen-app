class RetirementAccountsController < ApplicationController
  before_action :set_retirement_account, only: [:show, :edit, :update, :destroy]

  # GET /retirement_accounts
  # GET /retirement_accounts.json
  def index
    @retirement_accounts = RetirementAccount.all
  end

  # GET /retirement_accounts/1
  # GET /retirement_accounts/1.json
  def show
  end

  # GET /retirement_accounts/new
  def new
    @retirement_account = RetirementAccount.new
  end

  # GET /retirement_accounts/1/edit
  def edit
  end

  # POST /retirement_accounts
  # POST /retirement_accounts.json
  def create
    @retirement_account = RetirementAccount.new(retirement_account_params)

    respond_to do |format|
      if @retirement_account.save
        format.html { redirect_to @retirement_account, notice: 'Retirement account was successfully created.' }
        format.json { render :show, status: :created, location: @retirement_account }
      else
        format.html { render :new }
        format.json { render json: @retirement_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retirement_accounts/1
  # PATCH/PUT /retirement_accounts/1.json
  def update
    respond_to do |format|
      if @retirement_account.update(retirement_account_params)
        format.html { redirect_to @retirement_account, notice: 'Retirement account was successfully updated.' }
        format.json { render :show, status: :ok, location: @retirement_account }
      else
        format.html { render :edit }
        format.json { render json: @retirement_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retirement_accounts/1
  # DELETE /retirement_accounts/1.json
  def destroy
    @retirement_account.destroy
    respond_to do |format|
      format.html { redirect_to retirement_accounts_url, notice: 'Retirement account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retirement_account
      @retirement_account = RetirementAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retirement_account_params
      params.require(:retirement_account).permit(:balance)
    end
end
