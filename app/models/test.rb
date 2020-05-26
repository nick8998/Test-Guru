class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  scope :easy, -> { where("level < 2") }
  scope :middle, -> { where ("level > 1 and level < 5") }
  scope :hard, -> { where ("level > 4") }
  scope :show_tests_by_category, ->(category) { joins(:category).where(categories: { title: category }).order(id: :desc).pluck(:title) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validate :validate_min_level
  validates :title, :level, uniqueness: true

  private

  def validate_min_level
    errors.add(:level) if level.to_i < 0
  end
end
