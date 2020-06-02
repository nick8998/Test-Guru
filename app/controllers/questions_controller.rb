class QuestionsController < ApplicationController

  before_action :find_test, only: [:create, :new]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def show; end

  def new
    @question = Question.new
  end 

  def create
    @question = @test.questions.new(question_params)
    @question.test_id = params[:test_id]
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:wording, :sublevel)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
