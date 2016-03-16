require 'rails_helper'

RSpec.describe SharesController, type: :controller do
  let(:this_household) { create(:household)}
  let(:this_bill) { create(:bill)}
  let(:this_user) { create(:user)}
  let(:new_share) { build(:share)}
  let(:bad_share) { build(:share, share_amount: nil)}

describe "GET 'index'" do
  it "renders the index view" do
    get :index, household_id: this_household.id, bill_id: this_bill.id
    expect(subject).to render_template :index
  end
end

describe "GET 'new'" do
  it "renders the new view" do
    get :new, household_id: this_household.id, bill_id: this_bill.id
    expect(subject).to render_template :new
  end
end

describe "GET 'show'" do
  it "renders the show view" do
    new_share.save
    get :show, household_id: this_household.id, bill_id: this_bill.id, id: new_share.id
    expect(subject).to render_template :show
  end
end

describe "GET 'edit'" do
  it "renders the edit view" do
    new_share.save
    get :edit, household_id: this_household.id, bill_id: this_bill.id, id: new_share.id
    expect(subject).to render_template :edit
  end
end

describe "POST 'create'" do
  let(:share_params) do
    {
      share:{
        bill_id: 1,
        due_date: "2016-02-29 19:41:22",
        share_amount_cents: 50000,
        paid: false,
      },
      household_id: 1,
      bill_id: 2
    }
  end

  let(:bad_share_params) do
    {
      share:{
        share_amount_cents: nil
      },
      household_id: this_household.id,
      bill_id: this_bill.id,
      id: new_share.id
    }
  end

  it "creates a share" do
    post :create, share_params.merge(household_id: this_household.id, bill_id: this_bill.id)
    expect(new_share.share_amount_cents).to eq 50000
  end

  it "does not create a share when bad params are used" do
    new_share.save
    last_share = Share.last
    post :create, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id)
    new_share.reload
    expect(Share.last).to eq last_share
  end

  it "redirects to shares page for a bill when good params are used" do
    new_share.save
    post :create, share_params.merge(household_id: this_household.id, bill_id: this_bill.id)
    # Success case to index page
    expect(subject).to redirect_to new_household_bill_share_path
    # Error case to
  end

  it "displays the create new bill page when bad params are used" do
    new_share.save
    post :create, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id)
    expect(subject).to render_template :new
  end
end

describe "PATCH 'update'" do
  let(:share_params) do
    {
      share:{
        bill_id: 1,
        due_date: "2016-02-29 19:41:22",
        share_amount_cents: 50000,
        paid: false,
      },
      household_id: 1,
      bill_id: 2
    }

  end

  let(:bad_share_params) do
    {
      share:{
        share_amount_cents: nil
      },
      household_id: 1,
      bill_id: 2
    }
  end

  it "updates the share with good params" do
    new_share.save
    before_update = new_share.attributes
    patch :update, share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    new_share.reload
    expect(new_share.attributes).to_not eq before_update
  end

  it "does not update the share with bad params" do
    new_share.save
    patch :update, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    new_share.reload
    expect(new_share.share_amount_cents).to eq 1
  end

  it "redirects to the share's show page after a successful update" do
    new_share.save
    patch :update, share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    # Success case to index page
    expect(subject).to redirect_to household_bill_shares_path
  end

  it "shows the edit share page when attempting to update with bad params" do
    new_share.save
    patch :update, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    expect(subject).to render_template :edit
  end
end

describe "DELETE 'destroy'" do
  it "deletes a share" do
    new_share.save
    expect(Share.all). to include(new_share)
    delete :destroy, id: new_share.id, household_id: this_household.id, bill_id: this_bill.id
    expect(Share.all).to_not include(new_share)
  end

  it "renders the all shares view" do
    new_share.save
    delete :destroy, id: new_share.id, household_id: this_household.id, bill_id: this_bill.id
    expect(subject).to redirect_to household_bill_shares_path
  end
end

describe "GET 'share_status'" do
  it "renders the share_status view" do
    new_share.save
    get :share_status, household_id: this_household.id, bill_id: this_bill.id, share_id: new_share.id
    expect(subject).to render_template :share_status
  end
end

describe "PATCH 'share_status'" do
  let(:share_params) do
    {
      share:{
        bill_id: 1,
        due_date: "2016-02-29 19:41:22",
        share_amount_cents: 50000,
        paid: false,
      },
      household_id: 1,
      bill_id: 2
    }

  end

  let(:bad_share_params) do
    {
      share:{
        share_amount_cents: nil
      },
      household_id: 1,
      bill_id: 2
    }
  end

  it "updates the share with good params" do
    new_share.save
    before_update = new_share.attributes
    patch :update, share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    new_share.reload
    expect(new_share.attributes).to_not eq before_update
  end

  it "does not update the share with bad params" do
    new_share.save
    patch :update, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    new_share.reload
    expect(new_share.share_amount_cents).to eq 1
  end

  it "redirects to the share's show page after a successful update" do
    new_share.save
    patch :update, share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    # Success case to index page
    expect(subject).to redirect_to household_bill_shares_path
  end

  it "shows the edit share page when attempting to update with bad params" do
    new_share.save
    patch :update, bad_share_params.merge(household_id: this_household.id, bill_id: this_bill.id, id: new_share.id)
    expect(subject).to render_template :edit
  end
end


end
