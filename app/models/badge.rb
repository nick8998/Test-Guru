class Badge < ApplicationRecord
  has_many :success_badges, dependent: :destroy
  has_many :users, through: :success_badges, dependent: :destroy

  validates :title, :picture, presence: true
  validates :achievement, presence: true, uniqueness: { scope: :options } 
  validate :validate_new_badge

  def validate_new_badge
    unless Rules::ALLRULES.include?(:achievement)
      errors.add(:title, "can't be created")
    end
  end
end
