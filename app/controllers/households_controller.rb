class HouseholdsController < ApplicationController
  def index
    @households = Household.all
  end

  def new
    @household = Household.new
  end

  def create
    @household = Household.create( name: household_params[:household][:name], address: household_params[:household][:address], move_in_date: household_params[:household][:move_in_date])
    redirect_to shares_path(params[:share_id])
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
  def share_params
    params.permit(person: [:bill_id, :due_date, :share_amount, :paid])
  end
end
