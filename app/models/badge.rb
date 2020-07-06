class Badge < ApplicationRecord
  has_many :success_badges, dependent: :destroy
  has_many :users, through: :success_badges, dependent: :destroy

  validates :title, :picture, presence: true
  validates :achievement, presence: true, uniqueness: { scope: :options } 
  validates :achievement, inclusion: { :in => Rules::ALLRULES }

end
