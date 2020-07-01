class Rules < BadgesService

  def initialize(test_passage, current_user)
    super
  end

  def find_rule
    if OneTryRule.new(@test_passage, @current_user).check?
      badge = OneTryRule.new(@test_passage, @current_user).set_badge
    elsif LevelRule.new(@test_passage, @current_user).check?
      badge = LevelRule.new(@test_passage, @current_user).set_badge
    elsif CategoryTestRule.new(@test_passage, @current_user).check?
      badge = CategoryTestRule.new(@test_passage, @current_user).set_badge
    end
  end
end