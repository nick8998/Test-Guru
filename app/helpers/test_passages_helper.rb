module TestPassagesHelper

  def collection_timer_tests(tp)
    final = tp.created_at + tp.test.test_timer.hours + tp.test.test_timer.minutes + tp.test.test_timer.seconds
    time = [final.hour - Time.now.hour, final.min - Time.now.min, final.sec - Time.now.sec]
  end

end
