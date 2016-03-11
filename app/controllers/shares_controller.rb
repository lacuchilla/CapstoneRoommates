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
    @date = @specific_bill.due_date
    @shares = @specific_bill.shares
    
  end

  def create
    @share = Share.new(share_params[:share])
    @specific_bill = Bill.find(params[:bill_id])
    @specific_household = Household.find(params[:household_id])
    @date = @specific_bill.due_date
    @shares = @specific_bill.shares
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
    @user = User.find(@share.id)
  end

  def edit
    @share = Share.find(params[:id])
    @legend = "Edit Share"
    @url = "update"
  end

  def update
    @share = Share.update(params[:id], share_params[:share])
      if @share.save
        redirect_to household_bill_shares_path
      else
        render :edit
      end
    @url = "update"
  end

  def destroy
    Share.destroy(params[:id])
    redirect_to household_bill_shares_path
  end

  def share_status
    @share = Share.find(params[:share_id])
    @legend = "Edit Share"
    @url = "update"
    @date = @share.due_date
  end

  def update_share_status
    @share = Share.update(params[:share_id], share_params[:share])
      if @share.save
        redirect_to household_bill_shares_path
      else
        render :edit
      end
    @url = "update"
  end

  def bill_amount_unacounted_for
    @specific_bill = Bill.find(params[:bill_id])
    @specific_share = Share.find(params[:share_id])
    @share_amount = @specific_share.share_amount
    @share_amounts =
    @amount_remaining
#get bill amount
#have empty array to store share amounts
#iterate through created shares
#get share_amount values for each of them
#push share_amount to empty array
#display total amount of created shares for that bill on the screen
  end

private
  def share_params
    params.permit(share: [:bill_id, :due_date, :share_amount, :paid, :household_id, :user_id])
  end
end
