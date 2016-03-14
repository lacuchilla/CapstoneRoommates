class UsersController < ApplicationController

  def index
    @users = User.all
    @households = Household.all
  end

  def new
    @user = User.new
  end

  def create
    # POST /users
    # POST /users.json
    @specific_household = Household.find(params[:household_id])
    @user = User.new(user_params[:user])
    @user.household = @specific_household
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now

          format.html { redirect_to(@user, notice: 'User was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end

private

  def user_params
    params.permit(user: [:username, :email, :uid, :provider, :avatar_url, :image_url, :household_id, :name])
  end
end
