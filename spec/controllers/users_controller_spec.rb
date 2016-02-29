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
        album:{
          name: "Something something something"
        }
      }
    end

    let(:bad_params) do
      {
        album:{
          name: nil
        }
      }
    end

    it "creates an album" do
      last_album = Album.last
      post :create, params
      expect(Album.last).to_not eq last_album
    end

    it "does not create an album when bad params are used" do
      last_album = Album.last
      post :create, bad_params
      expect(Album.last).to eq last_album
    end

    it "redirects to albums index page" do
      post :create, params
      # Success case to index page
      expect(subject).to redirect_to albums_path
      # Error case to
      post :create, bad_params
      expect(subject).to render_template :new
    end
  end

  describe "PATCH 'update'" do
    let(:params) do
      {
        album:{
          name: "Something something something"
        },
        id: album.id
      }
    end

    let(:bad_params) do
      {
        album:{
          name: nil
        },
        id: album.id
      }
    end

    it "updates the album with good params" do
      before_update = album.attributes
      patch :update, params
      album.reload
      expect(album.attributes).to_not eq before_update
    end

    it "does not update the album with bad params" do
      before_update = album.attributes
      patch :update, bad_params
      album.reload
      expect(album.attributes).to eq before_update
    end

    it "redirects to the album's show page after a successful update" do
      patch :update, params
      # Success case to index page
      expect(subject).to redirect_to album_path
      # Error case to
      patch :update, bad_params
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        album:{
          name: "Something something something",
          rank: 0
        },
        id: album.id
      }
    end

    it "increments the rank of a album by 1" do
      before_upvote = album.attributes
      patch :upvote, params
      album.reload
      expect(album.attributes).to_not eq before_upvote
    end
  end

  describe "DELETE 'destroy'" do
    let(:params) do
      {
        id: album.id
      }
    end

    it "deletes an album" do
      expect(Album.all).to include(album)
      delete :destroy, params
      expect(Album.all).to_not include(album)
    end

    it "renders the all albums view" do
      get :index
      expect(subject).to render_template :index
    end
  end


end
