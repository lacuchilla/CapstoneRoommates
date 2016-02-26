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
    @bill = Bill.create(name: bill_params[:bill][:name], total_amount: bill_params[:bill][:total_amount], paid: bill_params[:bill][:paid], household_id: params[:household_id])
    if @bill.save
      redirect_to bills_path
    else
      render :new
    end
  end

  def new_share
    @bill = Bill.new
  end

  def create_share
    @bill = Bill.create(bill_params[:bill])
    if @bill.save
      redirect_to bills_path
    else
      render :new_share
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
    params.require(:bill).permit(:name, :total_amount, :number_of_people_responsible, :names_of_people_responsible, :paid, :due_date, :parent_key, :household_id)
  end

end
