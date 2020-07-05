class CategoryTestRule < Rules

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.tests.where(category_id: @test_passage.test.category_id).pluck(:title).sort
    @tests = Test.tests_by_category(@test_passage.test.category.title).sort
  end

  def check?
    if @current_user.badges.where(achievement: "category_test_rule", options: @test_passage.test.category.title).present?
      @last_badge_time = @current_user.badges.where(achievement: "category_test_rule", options: @test_passage.test.category.title).last.created_at
      check_test_passage 
    else
      return @user_tests.uniq == @tests.uniq
    end
  end

  def check_test_passage
    pass = []
    tests_passage = TestPassage.where("created_at > ?", @last_badge_time)
    tests_passage.each do |tp|
      if tp.test.category.title == @test_passage.test.category.title
        pass << tp.test.category.title
      end
    end
    return pass.sort.uniq == @tests.uniq
  end

end