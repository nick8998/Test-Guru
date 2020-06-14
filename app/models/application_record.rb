class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def admin?
    self.is_a?(Admin)
  end
end
