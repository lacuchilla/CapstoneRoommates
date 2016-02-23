class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.create(bill_params[:bill])
    if @bill.save
      redirect_to bills_path
    else
      render :new
    end
  end

  def show
    @bill = Bill.find(params[:id])
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
    params.permit(bill: [:name, :total_amount, :number_of_people_responsible, :names_of_people_responsible, :paid, :due_date])
  end

end
