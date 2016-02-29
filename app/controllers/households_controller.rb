class HouseholdsController < ApplicationController
  def index
    @households = Household.all
  end

  def new
    @household = Household.new
  end

  def create
    @household = Household.create(household_params)
    if @household.save
      redirect_to households_path
    else
      render :new
    end
  end

  def show
    @household = Household.find(params[:id])
  end

  def edit
    @household = Household.find(params[:id])
    @legend = "Edit Household"
  end

  def update
    @household = Household.update(params[:id], household_params[:household])
      if @household.save
        redirect_to household_path(params[:id])
      else
        render :edit
      end
  end

  def destroy
    Household.destroy(params[:id])
    redirect_to households_path
  end

private
  def household_params
    params.require(:household).permit(:name, :address, :move_in_date)
  end
end
