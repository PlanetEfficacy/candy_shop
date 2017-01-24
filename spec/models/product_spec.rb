require 'rails_helper'
describe Product, "validations" do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end
end
