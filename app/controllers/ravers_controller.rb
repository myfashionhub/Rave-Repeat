class RaversController < ApplicationController
  def index
    @ravers = Raver.all
  end

  def show
    @raver = current_raver
    @trip  = Trip.new
  end
end
