class LevelRule < Rules

  def initialize(test_passage, current_user)
    super
  end

  def check?
    @current_user.find_test_by_lvl(@test_passage.test.level) == Test.where(level: @test_passage.test.level)
  end

  def set_badge
    Badge.where(achievement: "level", options: @test_passage.test.level.to_s)
  end
end