class LevelRule < RuleForUniq

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.find_tests_by_lvl(@test_passage.test.level).sort
    @tests = Test.where(level: @test_passage.test.level).sort
    badge = Badge.where(achievement: "level_rule", options: @test_passage.test.level).first
    @user_badge = @current_user.success_badges.where(badge_id: badge.id)
  end 
end