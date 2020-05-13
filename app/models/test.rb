class Test < ApplicationRecord
  class << self
    def show_tests_by_category(category)
      self.select(:title).where(category: category).order(id: :desc)
    end
  end
end
