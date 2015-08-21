require 'auth_system'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include AuthSystem

  before_action :authenticate_user_from_token!
  
  skip_before_action :authenticate_user_from_token!

  rescue_from 'Exception' do |exception|
    Rails.logger.info exception
    Rails.logger.info exception.backtrace.join("\n")
    render :json => { exception: exception.backtrace.join("\n") }
  end
  
end
