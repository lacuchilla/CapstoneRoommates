class UsersController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
  end
end
