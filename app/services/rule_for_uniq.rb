class RuleForUniq < Rules
  def check?
    if @user_tests.count == @tests.count
      return @user_tests.uniq == @tests.uniq
    elsif @user_tests.count > @tests.count
      count_uniq
    end
  end

  def count_uniq
    counter = 0
    @tests.each do |test_lvl|
      counter += @user_tests.find_all{ |elem| elem == test_lvl }.count
    end
    
    return (counter % @tests.count) == 0
  end
end