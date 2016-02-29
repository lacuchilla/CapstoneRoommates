class SharesController < ApplicationController
  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.create(share_params[:share])
      if @share.save
        redirect_to household_bill_shares_path
      else
        render :new
      end
  end

  def show
    @share = Share.find(params[:id])
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
    params.permit(share: [:bill_id, :due_date, :share_amount, :paid, :household_id])
  end
end
