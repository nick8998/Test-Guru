class Guru::BadgesController < Guru::BaseController
  before_action :set_badges, only: %i[index]

  def index; end

  private 

  def set_badges
    @badges = current_user.badges
  end
end