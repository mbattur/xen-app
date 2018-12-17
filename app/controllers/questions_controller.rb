class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    @question.save
    redirect_to @question
  end

  private
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
