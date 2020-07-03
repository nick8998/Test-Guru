class Rules < BadgesService

  def find_rule
    badge = []
    if OneTryRule.new(@test_passage, @current_user).check?
      badge << set_badge("one_try", nil)
    end

    if LevelRule.new(@test_passage, @current_user).check?
      badge << set_badge("level",@test_passage.test.level.to_s)
    end

    if CategoryTestRule.new(@test_passage, @current_user).check?
      badge << set_badge("all_tests", "Backend")
    end
    return badge
  end

  def set_badge(achievement, options)
    Badge.where(achievement: achievement, options: options)
  end
end