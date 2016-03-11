class UsersController < ApplicationController

  def index
    @users = User.all
    @households = Household.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params[:user])

    # respond_to do |format|
      if @user.save
    #     UserMailer.welcome_email(@user).deliver_later
    #     format.html { redirect_to(@user, notice: 'User was successfully created.') }
    #     format.json { render json: @user, status: :created, location: @user }
        redirect_to users_path
      else
    #     format.html { render action: 'new' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
        render :new
    #     binding.pry
    #   end
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
