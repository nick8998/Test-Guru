class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true

  has_one :test_timer, dependent: :destroy
  
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  scope :easy, -> { where("level < 2") }
  scope :middle, -> { where ("level > 1 and level < 5") }
  scope :hard, -> { where ("level > 4") }
  scope :show_tests_by_category, ->(category) { joins(:category).where(categories: { title: category }).order(id: :desc) }

  validates :title, presence: true, uniqueness: { scope: :level } 
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.tests_by_category(category)
    show_tests_by_category(category).pluck(:title)
  end

end
