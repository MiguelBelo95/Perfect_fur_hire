class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def index
    @bookings = current_user.bookings
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = @pet.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to @pet, notice: 'Booking was successfully created.'
    else
      render "pets/show", status: :unprocessable_entity
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
