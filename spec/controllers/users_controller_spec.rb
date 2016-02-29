require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user) { create(:user)}

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET 'new'" do
    it "renders the new view" do
      get :new, id: new_user.id
      expect(subject).to render_template :new
    end
  end

  describe "GET 'show'" do
    it "renders the show view" do
      get :show, id: new_user.id
      expect(subject).to render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders the edit view" do
      get :edit, id: new_user.id
      expect(subject).to render_template :edit
    end
  end

  describe "POST 'create'" do
    let(:params) do
      {
        user:{
          uid: "Something something something",
          username: "Yin-Yarn",
          provider: "twitter"
        }
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

    it "does not create a user when bad params are used" do
      last_user = User.last
      post :create, bad_params
      expect(User.last).to eq last_user
    end

    it "redirects to users index page with good params" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to users_path
      # Error case to
    end

    it "renders the new user template when bad params are used" do
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        user:{
          uid: "Something something something",
          username: "Kirby",
          provider: "twitter"

        },
        id: new_user.id
      }
    end

    let(:bad_params) do
      {
        user:{
          username: nil
        },
        id: new_user.id
      }
    end

    it "updates the user with good params" do
      before_update = new_user.attributes
      patch :update, params
      new_user.reload
      expect(new_user.attributes).to_not eq before_update
    end

    it "does not update the album with bad params" do
      before_update = new_user.attributes
      patch :update, bad_params
      new_user.reload
      expect(new_user.attributes).to eq before_update
    end

    it "redirects to the album's show page after a successful update" do
      patch :update, params
      # Success case to index page
      expect(subject).to redirect_to user_path
    end

    it "renders the edit page when bad params are passed" do
      # Error case to
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: new_user.id
      }
    end

    it "deletes a user" do
      expect(User.all).to include(new_user)
      delete :destroy, params
      expect(User.all).to_not include(new_user)
    end

    it "renders the all users view" do
      delete :destroy, params
      expect(subject).to redirect_to users_path
    end
  end

end
