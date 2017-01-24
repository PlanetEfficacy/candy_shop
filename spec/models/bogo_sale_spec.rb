require 'rails_helper'

describe BogoSale, "validations" do
  it "has a valid factory" do
    expect(build(:bogo_sale)).to be_valid
  end

  it { should validate_presence_of :status }
end

describe BogoSale, "associations" do
  it { should belong_to :product }
end
