class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: @test.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new
  end 

  def create
    @test = Test.find(params[:test_id])
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    @test = Test.find(@question.test_id)
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy
    redirect_to questions_path
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
