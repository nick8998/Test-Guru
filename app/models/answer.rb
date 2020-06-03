class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :wording, presence: true
  validate :validate_new_answer

  def validate_new_answer
    if question.answers.count >= 4
      errors.add(:wording, "can't be created")
    end
  end
end