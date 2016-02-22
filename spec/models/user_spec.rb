require 'spec_helper'
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { build(:user) }
  let(:bad_id_user) { build(:user, username: "something new") }
  let(:bad_username_user) { build(:user, uid: "something new") }

  describe "validations" do
    it "is valid" do
      expect(new_user).to be_valid
    end

    it "requires a username" do
      new_user.username = nil
      expect(new_user).to be_invalid
    end

    it "requires a provider" do
      new_user.provider = nil
      expect(new_user).to be_invalid
    end

    it "requires a uid" do
      new_user.uid = nil
      expect(new_user).to be_invalid
    end

    it "has a unique uid" do
      new_user.save
      expect(bad_id_user).to_not be_valid
    end

    it "has a unique username" do
      new_user.save
      expect(bad_username_user).to_not be_valid
    end
  end
end
