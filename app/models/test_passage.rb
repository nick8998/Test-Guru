class TestPassage < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question

  def set_badge(current_user)
    if self.successful? and current_user.tests.where(id: self.test_id).count == 1
      badge = Badge.where(test_by_one: true)
      current_user.badges.push(badge)
    elsif current_user.find_test_by_lvl(self.test.level) == Test.where(level: self.test.level)
      badge = Badge.where(test_by_lvl: true)
      current_user.badges.push(badge)
    elsif Test.show_tests_by_category_arr(self.test.category.title) == current_user.tests.where(category_id: self.test.category_id)
      badge = Badge.where(all_tests: true)
      current_user.badges.push(badge)
    end
  end


  def completed? 
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
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
    self.correct_questions/self.test.questions.count*100 >= 85
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
    if self.current_question.nil?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_update_set_question
    self.current_question = next_question
  end

end
