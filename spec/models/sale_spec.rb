require 'rails_helper'

describe Sale, "validations" do
  it "has a valid factory" do
    expect(build(:sale)).to be_valid
  end

  it { should validate_presence_of :discount }
  it { should validate_presence_of :status }
  # it { validate_presence_of :unit_price }
  # it { validate_presence_of :warehouse_quantity }
  # it { validate_presence_of :store_quantity }
  # it { should validate_numericality_of(:unit_price) }
  # it { should validate_numericality_of(:warehouse_quantity) }
  # it { should validate_numericality_of(:store_quantity) }
end

describe Sale, "associations" do
  it { should belong_to :product }
end
