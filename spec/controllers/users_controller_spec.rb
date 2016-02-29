require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user) { create(:user)}
  describe "GET #show" do
    it "returns http success" do
      new_user.save
      get :show, id: new_user.id
      expect(response).to have_http_status(:success)
    end
  end

end
