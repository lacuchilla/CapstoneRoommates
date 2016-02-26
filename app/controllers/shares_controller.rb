class SharesController < ApplicationController
  def index
    @specific_user = User.find(user_id: params[:user_id])
    # @shares = @specific_bill.shares

    @shares = @specific_user.shares
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.create(share_params)
      if @share.save
        redirect_to bills_path(params[:bill_id])
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
    params.permit(person: [:bill_id, :due_date, :share_amount, :paid, :user_id])
  end
end
