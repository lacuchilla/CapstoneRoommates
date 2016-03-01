class BillsController < ApplicationController

  def index
    @specific_household = Household.find(params[:household_id])
  # @company = Company.person.find(@company_id(params[:id]))
    @specific_household.bills
  end

  def new
    @specific_household = Household.find(params[:household_id])
    @bill = Bill.new
    @url = "create"
  end

  def create
    @specific_household = Household.find(params[:household_id])
    binding.pry
    @bill = Bill.new(bill_params[:bill])
    @bill.household = @specific_household
    if @bill.save
      redirect_to household_bills_path
    else
     render :new
     @url = "create"
    end
  end

  def show
    @specific_household = Household.find(params[:household_id])
    @bill = Bill.find(params[:id])
    @date = @bill.due_date
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.update(params[:id], bill_params)
    if @bill.save
      redirect_to household_bills_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Bill.destroy(params[:id])
    redirect_to household_bills_path
  end

private
  def bill_params
    params.permit(:household_id, bill: [:name, :total_amount, :paid, :due_date])
  end

end
