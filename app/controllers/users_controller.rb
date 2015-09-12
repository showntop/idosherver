class UsersController < ApplicationController
  def show
    render json: current_user#.profile, serializer: UserSerializer
  end

  def update
    current_user.update_profile(profile_params)
    render json: current_user
  end

  private
  def profile_params
    params.require(:user_profile).permit(:location, :website, :identity_id)
  end
end
