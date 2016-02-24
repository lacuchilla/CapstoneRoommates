class SharesController < ApplicationController
  def index
    @specific_bill = Bill.find(params[:bill_id])
    @specific_bill.shares
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.create(bill_id: params[:bill_id], due_date: share_params[:share][:due_date], share_amount: share_params[:share][:share_amount])
    redirect_to shares_path(params[:share_id])
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
        redirect_to share_path(params[:id])
      else
        render :edit
      end
  end

  def destroy
    Share.destroy(params[:id])
    redirect_to shares_path
  end

private
  def share_params
    params.permit(person: [:bill_id, :due_date, :share_amount, :paid])
  end
end
