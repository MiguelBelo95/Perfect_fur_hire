class PagesController < ApplicationController
  def home
    # Add a new button here. link
    @pets = Pet.all
  end

end
