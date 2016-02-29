class BillsController < ApplicationController

  def index
    @bills = Bill.all
    @specific_household = Household.find(params[:household_id])
  # @company = Company.person.find(@company_id(params[:id]))
    @household_bills = @specific_household.bills
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.create(bill_params)
    if @bill.save
      redirect_to household_bills_path
    else
      render :new
    end
  end

  def show
    @bill = Bill.find(params[:id])
    @date = @bill.due_date
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.update(params[:id], bill_params[:bill])
    if @bill.save
      redirect_to bill_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Bill.destroy(params[:id])
    redirect_to bills_path
  end

private
  def bill_params
    params.require(:bill).permit(:name, :total_amount, :paid, :due_date, :household_id)
  end

end
