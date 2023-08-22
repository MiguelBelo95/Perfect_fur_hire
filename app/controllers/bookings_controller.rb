class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def index
    @user = User.find(params :user_id)
    @bookings = Booking.where(user_id: @user.id)

  end

  def new
    @booking = Booking.new
  end

  def create
    user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = user

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_note)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end