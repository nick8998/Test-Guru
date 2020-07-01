class OneTryRule < Rules

  def initialize(test_passage, current_user)
    super
  end

  def check?
    @test_passage.successful? and @current_user.tests.where(id: @test_passage.test_id).count == 1
  end

  def set_badge
    Badge.where(achievement: "one_try")
  end
end