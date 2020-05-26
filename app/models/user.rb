class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  scope :find_tests_by_lvl, ->(level) { Test.joins(:results, :users).where(level: level) }

  validates :mail, presence: true

end
