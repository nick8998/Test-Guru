class BadgesService

  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def badges
    Rules.new(@test_passage, @current_user).find_rule
  end
end