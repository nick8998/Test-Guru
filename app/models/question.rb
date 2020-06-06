class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :current_test_passages, foreign_key: "current_question_id", class_name: "TestPassage", dependent: :destroy
end
