class Badge < ApplicationRecord
  has_many :success_badges, dependent: :destroy
  has_many :users, through: :success_badges, dependent: :destroy
end
