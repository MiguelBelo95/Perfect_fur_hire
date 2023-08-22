class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]
  def new
    @booking = Booking.new
  end

  def create
    user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = user
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    raise
    # redirect_to restaurant_path(@restaurant)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_note)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
