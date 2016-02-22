class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :current_user
  protect_from_forgery with: :null_session

  def new
    provider = params[:format]
    redirect_to "/auth/#{provider}"
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
