class Test < ApplicationRecord
  def self.show_tests_by_category(category)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
