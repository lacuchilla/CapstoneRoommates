class HouseholdsController < ApplicationController
  def index
    @households = Household.all
  end

  def new
    @household = Household.new
    @url = "create"
  end

  def create
    # @url = "create"
    @household = Household.new(household_params[:household])
    if @household.save
      redirect_to households_path
     else
       render :new
       @url = "create"
    end
  end

  def show
    @household = Household.find(params[:id])
  end

  def edit
    @household = Household.find(params[:id])
    @legend = "Edit Household"
    @url = "update"
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
    params.permit(household: [:name, :address, :move_in_date])
  end
end
