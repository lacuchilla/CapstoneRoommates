class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    auth_hash = request.env['omniauth.auth']
  end

end
