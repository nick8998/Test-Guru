class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :user, -> { where "role = 1" }
  
  def self.show_tests_by_category(category)
    joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
