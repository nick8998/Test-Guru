class Test < ApplicationRecord
  def show_tests_by_category(category)
    category = Category.where(category: category)
    c_id = category.id
    self.where(category_id: c_id).order(id: :desc).pluck(:title)
  end
end
