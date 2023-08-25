class UsersController < ApplicationController
  # This is a comment
    def profile
        @user = current_user
        @bookings = @user.bookings
    end


end
