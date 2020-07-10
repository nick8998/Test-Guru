class CategoryTestRule < RuleForUniq

  def initialize(test_passage, current_user)
    super
    @user_tests = @current_user.tests.where(category_id: @test_passage.test.category_id).includes(:test_passages).where("test_passages.success == ?", true)
    @tests = Test.tests_by_category(@test_passage.test.category.title).sort
    badge = Badge.where(achievement: "category_test_rule", options: @test_passage.test.category.title).first
    @user_badges = @current_user.success_badges.where(badge_id: badge.id)
  end

  def check?
    if super
      super
    else
      @user_tests.pluck(:title).uniq == @tests.uniq
    end
  end


end