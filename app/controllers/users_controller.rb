class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params[:user])
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @legend = "Edit User"
  end

  def update
    @user = User.update(params[:id], user_params[:user])
      if @user.save
        redirect_to user_path(params[:id])
      else
        render :edit
      end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path
  end

private

  def user_params
    params.permit(user: [:username, :email, :uid, :provider, :avatar_url, :image_url, :household_id])
  end
end
