class RuleForUniq < Rules
  
  def check?
    if have_badge?
      check_test_passage 
    else
      @user_tests.uniq == @tests.uniq
    end
  end

  def have_badge?
    @user_badge.present?
  end

  def check_test_passage
    pass = []
    last_badge_time = @user_badge.last.created_at
    @user_tests.each  do |test|
      if test.test_passages.last.created_at > last_badge_time
        pass << test
      end
    end
    pass.uniq == @tests.uniq
  end
end