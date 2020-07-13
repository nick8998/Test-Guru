class TestTimer < ApplicationRecord
  belongs_to :test

  validates :hours, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 60 }
  validates :seconds, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 60 }
end
