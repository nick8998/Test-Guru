class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: Question.where(test_id: @test.id)}
  end

  def show
    render json: { questions: Question.find(params[:id])}
  end

  def new
    
  end 

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.destroy_by(id: params[:id])
    render plain: "Question deleted"
  end

  private

  def question_params
    params.require(:question).permit(:wording, :sublevel, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
