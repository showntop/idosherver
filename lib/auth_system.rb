module AuthSystem

  def current_user

    @current_user ##||= login_form_session || login_from_token
  end

  def signin_user(user)
    return if user.blank?
    user.settlein_token
    @current_user = user
  end

  def signout_user
    session[:current_user_id] = nil

    #cookies
    #request.env
  end

  def login_form_session
    return nil if session[:current_user_id].blank?
    User.find(session[:current_user_id])
  end


  def login_from_token token
    begin
      @current_user = User.find_by_token(token)
    rescue ActiveRecord::RecordNotFound => e
      @current_user = nil
    end
  end

  def authenticate_user_from_token!
    token = params[:token] || 'invalid'
    login_from_token token
    raise '未登录的用户' unless current_user#token失效
  end
end
