class User < ApplicationRecord


  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  devise :database_authenticatable, 
        :registerable,
        :recoverable,
        :trackable, 
        :rememberable, 
        :validatable,
        :confirmable

  def find_tests_by_lvl(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
