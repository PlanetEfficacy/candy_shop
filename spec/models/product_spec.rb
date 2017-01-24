require 'rails_helper'

describe Product, "validations" do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  it { validate_presence_of :name }
  it { validate_presence_of :unit_price }
  it { validate_presence_of :warehouse_quantity }
  it { validate_presence_of :store_quantity }
  it { should validate_numericality_of(:unit_price) }
  it { should validate_numericality_of(:warehouse_quantity) }
  it { should validate_numericality_of(:store_quantity) }
end

describe Product, ".dollar_price" do
  it "returns the price in dollars of a product" do
    product = create :product
    expect(product.dollar_price).to eq(1.00)
  end
end
