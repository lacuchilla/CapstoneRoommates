require 'rails_helper'

RSpec.describe BillsController, type: :controller do
    let(:this_household) { create(:household)}
    let(:new_bill) { build(:bill) }
    let(:bad_bill) { build(:bill, name: "March Rent")}

  describe "GET 'index'" do
    it "renders the index view" do
      get :index, household_id: this_household.id
      expect(subject).to render_template :index
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, household_id: this_household.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      new_bill.save
      get :show, household_id: this_household.id, id: new_bill.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      new_bill.save
      get :edit, household_id: this_household.id, id: new_bill.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:bill_params) do
      {
        bill:{
          name: "May Rent",
          total_amount_cents: 50000,
          paid: false,
          due_date: "2016-02-29 19:41:22"
        },
        household_id: 1
      }
    end

    let(:bad_bill_params) do
      {
        bill:{
          name: nil
        },
        household_id: 1
      }
    end

    it "creates a bill" do
      new_bill.save
      last_bill = Bill.last
      post :create, bill_params.merge(household_id: this_household.id)
      new_bill.reload
      expect(Bill.last).to_not eq last_bill
    end

    it "creates a valid bill" do


    end

    it "does not create a bill when bad params are used" do
      new_bill.save
      last_bill = Bill.last
      post :create, bad_bill_params.merge(household_id: this_household.id)
      new_bill.reload
      expect(Bill.last).to eq last_bill
    end

    it "redirects to new household bill shares page when good params are used" do
      new_bill.save
      post :create, bill_params.merge(household_id: this_household.id, bill_id: new_bill.id)
      new_bill.reload
      expect(subject).to redirect_to new_household_bill_share_path
    end

    it "displays the create new bill page when bad params are used" do
      new_bill.save
      post :create, bad_bill_params.merge(household_id: this_household.id)
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:bill_params) do
      {
        bill: {
          name: "June Rent",
          total_amount_cents: 50000,
          paid: false
        },
        household_id: 1
      }
    end

    let(:bad_bill_params) do
      {
        bill:{
          name: nil,
          total_amount_cents: nil,
          paid: nil
        },
        household_id: 1
      }
    end

    it "updates the bill with good params" do
      new_bill.save
      before_update = new_bill.attributes
      patch :update, bill_params.merge(household_id: this_household.id, id: new_bill.id)
      new_bill.reload
      expect(new_bill.attributes).to_not eq before_update
    end

    it "does not update the bill with bad params" do
      new_bill.save
      before_update = new_bill.attributes
      patch :update, bad_bill_params.merge(household_id: this_household.id, id: new_bill.id)
      new_bill.reload
      expect(new_bill.attributes).to eq before_update
    end

    it "redirects to the bill's show page after a successful update" do
      new_bill.save
      patch :update, bill_params.merge(household_id: this_household.id, id: new_bill.id)
      # Success case to index page
      expect(subject).to redirect_to household_bills_path
    end

    it "shows the edit bill page when attempting to update with bad params" do
      new_bill.save
      patch :update, bad_bill_params.merge(household_id: this_household.id, id: new_bill.id)
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    it "deletes a bill" do
      new_bill.save
      expect(Bill.all). to include(new_bill)
      delete :destroy, id: new_bill.id, household_id: this_household.id
      expect(Bill.all).to_not include(new_bill)
    end

    it "renders the all bills view" do
      new_bill.save
      delete :destroy, id: new_bill.id, household_id: this_household.id
      expect(subject).to redirect_to household_bills_path
    end
  end

end
