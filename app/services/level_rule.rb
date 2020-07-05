class LevelRule < Rules

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.find_tests_by_lvl(@test_passage.test.level).sort
    @tests = Test.where(level: @test_passage.test.level).sort
  end

  def check?
    if @current_user.badges.where(achievement: "level_rule", options: @test_passage.test.level).present?
      @last_badge_time = @current_user.badges.where(achievement: "level_rule", options: @test_passage.test.level).last.created_at
      check_tests_passage
    else
      return @user_tests.uniq == @tests.uniq
    end
  end

  def check_tests_passage
    pass = []
    tests_passage = @current_user.test_passages.where("created_at > ?", @last_badge_time)
    tests_passage.each do |tp|
      if tp.test.level == @test_passage.test.level
        pass << tp.test.level
      end
    end
    pass.sort.uniq == @tests.uniq
  end
end