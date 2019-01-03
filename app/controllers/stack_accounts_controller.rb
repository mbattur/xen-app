class StackAccountsController < ApplicationController
  before_action :set_stack_account, only: [:show, :edit, :update, :destroy]

  # GET /stack_accounts
  # GET /stack_accounts.json
  def index
    @stack_accounts = StackAccount.all
  end

  # GET /stack_accounts/1
  # GET /stack_accounts/1.json
  def show
  end

  # GET /stack_accounts/new
  def new
    @stack_account = StackAccount.new
  end

  # GET /stack_accounts/1/edit
  def edit
  end

  # POST /stack_accounts
  # POST /stack_accounts.json
  def create
    @stack_account = StackAccount.new(stack_account_params)

    respond_to do |format|
      if @stack_account.save
        format.html { redirect_to @stack_account, notice: 'Stack account was successfully created.' }
        format.json { render :show, status: :created, location: @stack_account }
      else
        format.html { render :new }
        format.json { render json: @stack_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stack_accounts/1
  # PATCH/PUT /stack_accounts/1.json
  def update
    respond_to do |format|
      if @stack_account.update(stack_account_params)
        format.html { redirect_to @stack_account, notice: 'Stack account was successfully updated.' }
        format.json { render :show, status: :ok, location: @stack_account }
      else
        format.html { render :edit }
        format.json { render json: @stack_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stack_accounts/1
  # DELETE /stack_accounts/1.json
  def destroy
    @stack_account.destroy
    respond_to do |format|
      format.html { redirect_to stack_accounts_url, notice: 'Stack account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack_account
      @stack_account = StackAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_account_params
      params.require(:stack_account).permit(:balance)
    end
end
