class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question


  def completed? 
    current_question.nil?
  end

  def time_is_out?
    Time.now >= self.created_at + self.test.test_timer.hours + self.test.test_timer.minutes + self.test.test_timer.seconds
  end

  def accept!(answer_ids)
    if time_is_out?
      self.current_question = nil
    else
      self.correct_questions += 1 if correct_answer?(answer_ids) 
    end 
    save!
  end

  def result_procent
    self.correct_questions*100/self.test.questions.count
  end

  def question_number
    self.test.questions.pluck(:id).index(self.current_question.id) + 1
  end

  def progress
    (self.question_number * 100) / self.test.questions.count
  end

  def successful?
    unless self.correct_questions.nil?
      self.correct_questions/self.test.questions.count*100 >= 85
    end
  end
  
  private


  def correct_answer?(answer_ids)
    correct_answers.ids.sort ==  answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.new_record? 
      test.questions.first if test.present?
    elsif self.current_question.nil?
      nil
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_update_set_question
    self.current_question = next_question
  end

end
