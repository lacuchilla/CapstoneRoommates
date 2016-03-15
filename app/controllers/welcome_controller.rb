class WelcomeController < ApplicationController
  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end

  def index
    @users = User.all
    @households = Household.all
  end
end
