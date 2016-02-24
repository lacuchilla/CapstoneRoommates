require 'rails_helper'

RSpec.describe BillsController, type: :controller do
    let(:new_bill) { build(:bill) }
    let(:bad_bill) { build(:bill, name: "March Rent")}

  describe "GET 'index'" do
    it "renders the index view" do
      get :index
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      new_bill.save
      get :show, id: new_bill.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      new_bill.save
      get :edit, id: new_bill.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:bill_params) do
    {
      bill:{
        name: "May Rent",
        total_amount: 50000,
        number_of_people_responsible: 3,
        names_of_people_responsible: "Prince Fluff, Yin Yarn, Adeleine",
        paid: false
        }
      }
    end

    let(:bad_bill_params) do
      {
        bill:{
          name: nil
        }
      }
    end

    it "creates a bill" do
      new_bill.save
      last_bill = Bill.last
      post :create, bill_params
      expect(Bill.last).to_not eq last_bill
    end

    it "does not create a bill when bad params are used" do
      last_bill = Bill.last
      post :create, bad_bill_params
      expect(Bill.last).to eq last_bill
    end

    it "redirects to bills index page" do
      post :create, bill_params
      # Success case to index page
      expect(subject).to redirect_to bills_path
      # Error case to
      post :create, bad_bill_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:bill_params) do
    {
      bill:{
        name: "June Rent",
        total_amount: 50000,
        number_of_people_responsible: 3,
        names_of_people_responsible: "Prince Fluff, Yin Yarn, Adeleine",
        paid: false
      }
    }
  end

  let(:bad_bill_params) do
    {
      bill:{
        name: nil
      }
    }
  end


    it "updates the bill with good params" do
      new_bill.save
      before_update = new_bill.attributes
      patch :update, bill_params.merge(id: new_bill.id)
      new_bill.reload
      expect(new_bill.attributes).to_not eq before_update
    end

    it "does not update the bill with bad params" do
      new_bill.save
      before_update = new_bill.attributes
      patch :update, bad_bill_params
      new_bill.reload
      expect(new_bill.attributes).to eq before_update
    end

    it "redirects to the bill's show page after a successful update" do
      patch :update, bill_params
      # Success case to index page
      expect(subject).to redirect_to bill_path
      # Error case to
      patch :update, bad_bill_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: new_bill.id
      }
    end

    it "deletes a bill" do
      new_bill.save
      expect(Bill.all). to include(new_bill)
      delete :destroy, params
      expect(Bill.all).to_not include(new_bill)
    end

    it "renders the all bills view" do
      new_bill.save
      delete :destroy, params
      expect(subject).to redirect_to bills_path
    end
  end

end
