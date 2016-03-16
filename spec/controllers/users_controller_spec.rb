require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user) { create(:user) }
  let(:this_bill) { create (:household) }
  let(:this_household) { create (:household) }

  describe "GET 'index'" do
    it "is successful" do
      get :index, household_id: this_household.id
      expect(response.status).to eq 200
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
      get :show, household_id: this_household.id, id: new_user.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, household_id: this_household.id, id: new_user.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        user:{
          uid: "Something something something",
          username: "Yin-Yarn",
          provider: "twitter",
          email: "amyrhunter@gmail.com"
        },
        household_id: this_household.id,
        id: new_user.id
      }
    end

    let(:bad_params) do
      {
        user:{
          username: nil
        }
      }
    end

    it "creates a user" do
      last_user = User.last
      post :create, params
      expect(User.last).to_not eq last_user
    end

    # it "does not create a user when bad params are used" do
    #   last_user = User.last
    #   post :create, bad_params
    #   expect(User.last).to eq last_user
    # end

    it "redirects to user page with good params" do
      new_user.save
      post :create, params.merge(household_id: this_household.id, id: new_user.id)
      # Success case to index page
      expect(subject).to redirect_to household_user_path
      # Error case to
    end

    it "renders the new user template when bad params are used" do
      post :create, bad_params.merge(household_id: this_household.id, id: new_user.id)
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        user:{
          uid: "Something something something",
          name: "Kirby",
          provider: "twitter"

        },
        household_id: this_household.id,
        id: new_user.id
      }
    end

    let(:bad_params) do
      {
        user:{
          username: nil
        },
        household_id: this_household.id,
        id: new_user.id
      }
    end

    it "updates the user with good params" do
      patch :update, params.merge(household_id: this_household.id, id: new_user.id)
      new_user.reload
      expect(new_user.name).to eq "Kirby"
    end

    it "does not update the user with bad params" do
      patch :update, bad_params.merge(household_id: this_household.id, id: new_user.id)
      new_user.reload
      expect(new_user.username).to eq "MyString"
    end

    it "redirects to the user's show page after a successful update" do
      patch :update, params.merge(household_id: this_household.id, id: new_user.id)
      # Success case to index page
      expect(subject).to redirect_to household_user_path
    end

    it "renders the edit page when bad params are passed" do
      # Error case to
      patch :update, bad_params.merge(household_id: this_household.id, id: new_user.id)
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        household_id: this_household.id,
        id: new_user.id

      }
    end

    it "deletes a user" do
      expect(User.all).to include(new_user)
      delete :destroy, household_id: this_household.id, id: new_user.id
      expect(User.all).to_not include(new_user)
    end

    it "renders the all users view" do
      delete :destroy, household_id: this_household.id, id: new_user.id
      expect(subject).to redirect_to household_users_path
    end
  end

end
