class UsersController < ApplicationController
  def show
    render json: current_user#.profile, serializer: UserSerializer
  end

  def update
  end
end
