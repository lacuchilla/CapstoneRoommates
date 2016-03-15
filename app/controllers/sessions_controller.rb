class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    provider = params[:format]
    redirect_to "/auth/twitter"
  end

  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
