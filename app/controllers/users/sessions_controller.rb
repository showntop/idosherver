class Users::SessionsController < ApplicationController

  skip_before_action :authenticate_user_from_token!

  def create
    login_name = params[:login] || ''
    password = params[:password] || ''
 
   if u = User.find_by_login_or_email(login_name)
     render json: {error: n.t("login.incorrect_username_email_or_password")} and return unless u.password_right? password
     signin_user u    
     render json: current_user
    else
      render json: {error: I18n.t("login.incorrect_username_email_or_password")}
    end

  end

  def destroy
    
  end
end
