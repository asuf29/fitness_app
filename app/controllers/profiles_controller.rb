class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      flash.now[:alert] = "Failed to update profile. Please try again."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_picture, :email, :first_name, :last_name, :username)
  end
end