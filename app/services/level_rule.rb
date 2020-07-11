class LevelRule < RuleForUniq

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.find_tests_by_lvl(@test_passage.test.level).includes(:test_passages).where("test_passages.success == ?", true)
    @tests = Test.where(level: @test_passage.test.level).sort
    badge = Badge.where(achievement: "level_rule", options: @test_passage.test.level).first
    @user_badges = @current_user.success_badges.where(badge_id: badge.id)
  end 
end