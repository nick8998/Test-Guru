class RuleForUniq < Rules
  
  def check?
    if have_badge?
      check_test_passage 
    else
      @user_tests.sort.uniq == @tests.uniq
    end
  end

  def have_badge?
    @user_badges.present?
  end

  def check_test_passage
    pass = []
    last_badge_time = @user_badges.order(created_at: :asc).last.created_at
    pass = @user_tests.includes(:test_passages).where("test_passages.created_at > ?", last_badge_time)  
    pass.sort.uniq == @tests.uniq
  end
end