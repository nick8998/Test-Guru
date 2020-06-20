class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    link_to_gist = result.html_url
    
    gist_params = { 
      question: @test_passage.current_question,
      gist_url: result.html_url
    }

    current_user.gists.create(gist_params)

    flash_options = if result.success?
      { notice: t('.success', href: "#{view_context.link_to("Your gist", link_to_gist)}") }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end


end
