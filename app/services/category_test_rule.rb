class CategoryTestRule < RuleForUniq

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.tests.where(category_id: @test_passage.test.category_id).pluck(:title)
    @tests = Test.tests_by_category(@test_passage.test.category.title)
  end

end