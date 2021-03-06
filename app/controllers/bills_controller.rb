class BillsController < ApplicationController

  def index
    @specific_household = Household.find(params[:household_id])
  # @company = Company.person.find(@company_id(params[:id]))
    @specific_household.bills
    @bills = Bill.all
  end

  def new
    @specific_household = Household.find(params[:household_id])
    @bill = Bill.new
    @url = "create"
  end

  def create
    @specific_household = Household.find(params[:household_id])
    @bill = Bill.new(bill_params[:bill])
    @bill.household = @specific_household
    if @bill.save
      redirect_to new_household_bill_share_path(params[:household_id], @bill.id)
    else
     render :new
    end
    @url = "create"
  end

  def show
    @specific_household = Household.find(params[:household_id])
    @bill = Bill.find(params[:id])
    @date = @bill.due_date

  end

  def edit
    @bill = Bill.find(params[:id])
    # @specific_household = Household.find(params[:household_id])
    @legend = "Edit Bill"
    @statuses = Bill.bill_statuses
    @url = "update"
  end

  def update
    @bill = Bill.update(params[:id], bill_params[:bill])
    @statuses = Bill.bill_statuses
    if @bill.save
      redirect_to household_bills_path(params[:household_id])
    else
      render :edit
    end
    @url = "update"
  end

  def destroy
    Bill.destroy(params[:id])
    redirect_to household_bills_path
  end

private
  def bill_params
    params.permit(:household_id, bill: [:id, :name, :total_amount, :paid, :due_date, :payment_type, :bill_status])
  end

end
