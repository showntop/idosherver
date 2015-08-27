class UsersController < ApplicationController
  def show
    render json: current_user#.profile, serializer: UserSerializer
  end

  def update
    current_user.update_profile(user_params)
    render json: current_user
  end

  private
  def user_params
    params.require(:user).permit(:location, :website, :identity_id)
  end
end
