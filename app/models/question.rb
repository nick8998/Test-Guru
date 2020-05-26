class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :wording, presence: true, if: :answers?

  private

  def answers?
    self.joins(:answers).size < 5
  end

end
