class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    # redirect_to
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = User.first #current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :description)
  end
end
