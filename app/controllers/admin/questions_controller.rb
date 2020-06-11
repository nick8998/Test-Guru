class Admin::QuestionsController < Admin::BaseController

  before_action :authenticate_user!
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def show; end

  def new
    @question = @test.questions.new
  end 

  def create
    @question = @test.questions.new(question_params)
    @question.test_id = params[:test_id]
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id)
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
