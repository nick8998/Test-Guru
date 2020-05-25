class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy
  
  def find_tests_by_lvl(level)
    Results.joins(:users, :tests).where(tests: { level: level })
  end
end
