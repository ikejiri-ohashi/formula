class UsersController < ApplicationController
  def destroy
    @user.delete
  end
end
