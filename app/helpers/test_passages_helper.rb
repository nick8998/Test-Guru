module TestPassagesHelper

  def collection_timer_tests(tp)
    create_time = [tp.created_at.hour,tp.created_at.min,tp.created_at.sec]
    tp = [tp.test.test_timer.hours, tp.test.test_timer.minutes, tp.test.test_timer.seconds]
    hours = create_time[0] + tp[0] - Time.now.hour
    minutes = create_time[1] + tp[1] - Time.now.min
    seconds = create_time[2] + tp[2] - Time.now.sec
    time = [hours, minutes, seconds]
  end

end
