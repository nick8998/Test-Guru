class GistsController < ApplicationController
  def index
    @gist = Gist.all
  end
end
