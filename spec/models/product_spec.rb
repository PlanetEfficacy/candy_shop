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

describe Product, "associations" do
  it { should have_many :sales }
  it { should have_many :bogo_sales }
end

describe Product, ".dollar_price" do
  it "returns the price in dollars of a product" do
    product = create :product
    expect(product.dollar_price).to eq(1.00)
  end
end

describe Product, ".sort_by_price" do
  it "returns all the products ordered by unit price high to low" do
    product_1 = create :product, unit_price: 1
    product_2 = create :product, unit_price: 2
    product_3 = create :product, unit_price: 3, name: "A"
    product_4 = create :product, unit_price: 3, name: "B"

    expect(Product.sort_by_price.count).to eq(4)
    expect(Product.sort_by_price.first).to eq(product_3)
    expect(Product.sort_by_price.second).to eq(product_4)
    expect(Product.sort_by_price.third).to eq(product_2)
    expect(Product.sort_by_price.last).to eq(product_1)
  end
end

describe Product, ".sort_by_warehouse" do
  it "returns all the products ordered by warehouse quantity high to low" do
    product_1 = create :product, warehouse_quantity: 1
    product_2 = create :product, warehouse_quantity: 2
    product_3 = create :product, warehouse_quantity: 3, name: "A"
    product_4 = create :product, warehouse_quantity: 3, name: "B"

    expect(Product.sort_by_warehouse.count).to eq(4)
    expect(Product.sort_by_warehouse.first).to eq(product_3)
    expect(Product.sort_by_warehouse.second).to eq(product_4)
    expect(Product.sort_by_warehouse.third).to eq(product_2)
    expect(Product.sort_by_warehouse.last).to eq(product_1)
  end
end

describe Product, ".sort_by_store" do
  it "returns all the products ordered by store quantity high to low" do
    product_1 = create :product, store_quantity: 1
    product_2 = create :product, store_quantity: 2
    product_3 = create :product, store_quantity: 3, name: "A"
    product_4 = create :product, store_quantity: 3, name: "B"

    expect(Product.sort_by_store.count).to eq(4)
    expect(Product.sort_by_store.first).to eq(product_3)
    expect(Product.sort_by_store.second).to eq(product_4)
    expect(Product.sort_by_store.third).to eq(product_2)
    expect(Product.sort_by_store.last).to eq(product_1)
  end
end

describe Product, ".sale_price" do
  it "returns price based on all active sales" do
    product = create :product_with_sale
    product.sales.create(discount: 10, status: 0)
    expect(product.sale_price).to eq(0.50)
  end

  it "returns regular price if there are no active sales" do
    product = create :product
    expect(product.sale_price).to eq(product.dollar_price)
  end
end

describe Product, ".bogo_sale" do
  it "returns true if there is an active bogo sale, otherwise returns false" do
    product = create :product
    product_with_bogo_sale = create :product_with_bogo_sale
    expect(product.bogo_sale).to eq(false)
    expect(product_with_bogo_sale .bogo_sale).to eq(true)
  end
end

describe Product, ".sell_by_date" do
  it "returns the date 2 weeks before the expiration date" do
    product = create :product, expiration: DateTime.new(2017, 1, 24)
    expect(product.sell_by_date).to eq(DateTime.new(2017, 1, 10))
  end
end

describe Product, ".unexpired" do
  it "returns all the products whose sell by date has not passed" do
    expired_product = create :expired_product
    unexpired_product = create :product, name: "unexpired product"
    inedible_product = create :inedible_product

    expect(Product.unexpired.count).to eq(2)
    expect(Product.unexpired.first).to eq(unexpired_product)
    expect(Product.unexpired.last).to eq(inedible_product)
  end
end

describe Product, ".total_value" do
  it "returns the value of all products in inventory" do
    expired_product = create :expired_product
    unexpired_product = create :product, name: "unexpired product"
    inedible_product = create :inedible_product

    expect(Product.total_value).to eq(220000)
  end
end
