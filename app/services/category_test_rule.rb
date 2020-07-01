class CategoryTestRule < Rules

  def initialize(test_passage, current_user)
    super
  end

  def check?
    Test.show_tests_by_category_arr(@test_passage.test.category.title) == @current_user.tests.where(category_id: @test_passage.test.category_id)
  end

  def set_badge
    Badge.where(achievement: "all_tests", options: "Backend")
  end
end