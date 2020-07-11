class Guru::BaseController < ApplicationController

  layout 'guru'
  before_action :authenticate_user!
end