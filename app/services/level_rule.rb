class LevelRule < RuleForUniq

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.find_tests_by_lvl(@test_passage.test.level).pluck
    @tests = Test.where(level: @test_passage.test.level).pluck
  end

end