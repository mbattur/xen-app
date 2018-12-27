class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    @question.save
    redirect_to my_portfolio_path
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to my_portfolio_path, notice: 'Questions were successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(
        :first_name, :last_name, :email, :phone, :address1, :address2, 
        :city, :state, :zip, :occupation, :birthday, :annual_income, 
        :paycheck, :paycheck_occurance, :card_debt, :consumer_debt, 
        :mortgage_balance, :retirment_contribution, :college_contribution, 
        :cash_savings
      )
    end
end
