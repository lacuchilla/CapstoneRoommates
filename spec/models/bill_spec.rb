require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:new_bill) { create(:bill) }
  let(:bad_bill) { create(:bill, username: "something") }

  describe "validations" do
    it "is valid" do
      expect(new_bill).to be_valid
    end

    it "requires a name" do
      new_bill.name = nil
      expect(new_bill).to be_invalid
    end

    it "requires a total amount" do
      new_bill.total_amount = nil
      expect(new_bill).to be_invalid
    end

    it "requires a paid status" do
      new_bill.paid = nil
      expect(new_bill).to be_invalid
    end

    it "requires a due date" do
      new_bill.due_date = nil
      expect(new_bill).to be_invalid
    end

    it "requires a paid status" do
      new_bill.paid = nil
      expect(new_bill).to be_invalid
    end
  end
end
