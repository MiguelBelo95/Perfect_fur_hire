class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

##MapBox
def index
  @pets = Pet.all
  @pets = @pets.where(user_id: params[:user_id]) if params[:user_id]
  # The `geocoded` scope filters only flats with coordinates
  @markers = @pets.geocoded.map do |pet|
    {
      lat: pet.latitude,
      lng: pet.longitude
    }
  end
end

  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def new
    @pet = Pet.new
  end

  def create
    # @pet = Pet.new(pet_params)
    # @pet.user = current_user
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy! if current_user == @pet.user
    redirect_to pets_path
  end


#MapBox

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :description, :image)
  end
end
