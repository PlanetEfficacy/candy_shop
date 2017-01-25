require 'rails_helper'

describe "GET /api/v1/products", type: :request do
  it "returns price, quantity of all products" do
    create_list :product, 2

    get "/api/v1/products"
    products = JSON.parse(response.body)

    expect(response).to be_success
    expect(products).to be_instance_of(Array)
    expect(products.count).to eq(2)
    expect(products.first['id']).to eq(Product.first.id)
    expect(products.first['name']).to eq("Chocolate Bar")
    expect(products.first['price']).to eq("1.00")
    expect(products.first['warehouse_quantity']).to eq(1000)
    expect(products.first['store_quantity']).to eq(100)
    expect(products.first['expiration']).to eq(
      Product.first.expiration.strftime("%Y-%m-%d"))
  end

  context "request contains paramaters sort_by=price" do
    it "returns all products sorted by price" do
      product_1 = create :product, unit_price: 1
      product_2 = create :product, unit_price: 2
      product_3 = create :product, unit_price: 3, name: "A"
      product_4 = create :product, unit_price: 3, name: "B"

      get "/api/v1/products?sort_by=price"
      products = JSON.parse(response.body)

      expect(response).to be_success
      expect(products.count).to eq(4)
      expect(products.first['id']).to eq(product_3.id)
      expect(products.second['id']).to eq(product_4.id)
      expect(products.third['id']).to eq(product_2.id)
      expect(products.last['id']).to eq(product_1.id)
    end
  end

  context "request contains paramaters sort_by=warehouse" do
    it "returns all products sorted by warehouse quantity" do
      product_1 = create :product, warehouse_quantity: 1
      product_2 = create :product, warehouse_quantity: 2
      product_3 = create :product, warehouse_quantity: 3, name: "A"
      product_4 = create :product, warehouse_quantity: 3, name: "B"
      create :expired_product

      get "/api/v1/products?sort_by=warehouse"
      products = JSON.parse(response.body)

      expect(response).to be_success
      expect(products.count).to eq(4)
      expect(products.first['id']).to eq(product_3.id)
      expect(products.second['id']).to eq(product_4.id)
      expect(products.third['id']).to eq(product_2.id)
      expect(products.last['id']).to eq(product_1.id)
    end
  end

  context "request contains paramaters sort_by=store" do
    it "returns all products sorted by store quantity" do
      product_1 = create :product, store_quantity: 1
      product_2 = create :product, store_quantity: 2
      product_3 = create :product, store_quantity: 3, name: "A"
      product_4 = create :product, store_quantity: 3, name: "B"
      create :expired_product

      get "/api/v1/products?sort_by=store"
      products = JSON.parse(response.body)

      expect(response).to be_success
      expect(products.count).to eq(4)
      expect(products.first['id']).to eq(product_3.id)
      expect(products.second['id']).to eq(product_4.id)
      expect(products.third['id']).to eq(product_2.id)
      expect(products.last['id']).to eq(product_1.id)
    end
  end

  context "there are expired products in inventory" do
    it "returns products that have not expired" do
      product_1 = create :expired_product, name: "A"
      product_2 = create :product, name: "B"
      product_3 = create :product, name: "C"

      get "/api/v1/products"
      products = JSON.parse(response.body)

      expect(response).to be_success
      expect(products.count).to eq(2)
      expect(products.first['id']).to eq(product_2.id)
      expect(products.second['id']).to eq(product_3.id)
    end
  end
end
