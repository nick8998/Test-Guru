class OneTryRule < Rules

  def check?
    @test_passage.successful? and @current_user.tests.where(id: @test_passage.test_id).count == 1
  end
  
end