class QuestionsController < ApplicationController
  
  def index
    @question = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def new
  end

  def create
    @question = Question.new(params[:question])

    @question.save
    redirect_to @question
  end

  private
    def question_params
      params.require(:question).permit(:first_name, :last_name)
    end
end
