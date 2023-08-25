class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end


end
