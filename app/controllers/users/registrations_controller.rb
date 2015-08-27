class Users::RegistrationsController < ApplicationController

  skip_before_action :authenticate_user_from_token!

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: user.errors, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :mobile, :password)
  end
end
