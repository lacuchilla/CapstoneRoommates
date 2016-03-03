class SharesController < ApplicationController
  def index
    @specific_household = Household.find(params[:household_id])
    @household_bills = @specific_household.bills
    @specific_bill = Bill.find(params[:bill_id])
    @bill_shares = @specific_bill.shares
    @shares = Share.all


  end

  def new
    @share = Share.new(share_params[:share])
    @specific_household = Household.find(params[:household_id])
  # @company = Company.person.find(@company_id(params[:id]))
    @household_bills = @specific_household.bills
    @specific_bill = Bill.find(params[:bill_id])
  end

  def create
    @share = Share.new(share_params[:share])
    @specific_bill = Bill.find(params[:bill_id])
    @specific_household = Household.find(params[:household_id])
    @share.bill = @specific_bill
      if @share.save
        redirect_to new_household_bill_share_path
      else
        render :new
      end
  end

  def show
    @share = Share.find(params[:id])
    @specific_bill = Bill.find(params[:bill_id])
    @share.bill = @specific_bill
  end

  def edit
    @share = Share.find(params[:id])
    @legend = "Edit Share"
  end

  def update
    @share = Share.update(params[:id], share_params[:share])
      if @share.save
        redirect_to household_bill_shares_path
      else
        render :edit
      end
  end

  def destroy
    Share.destroy(params[:id])
    redirect_to household_bill_shares_path
  end

private
  def share_params
    params.permit(share: [:bill_id, :due_date, :share_amount, :paid, :household_id, :user_id])
  end
end
