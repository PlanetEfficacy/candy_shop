require 'rails_helper'

# I need an easy way to be able to view all of my products.
# This list of products needs to show me the price, quantity
# available to ship, and quantity distributed to my Al's
# Candies™ stores. It would also be nice to be able to sort
# by those attributes as well.
describe "GET /products", type: :request do
  it "returns price, quantity of all products" do
    create_list :product, 2

    get "/api/v1/products"
    products = JSON.parse(response.body)

    expect(response).to be_success
    expect(products).to be_instance_of(Array)
    expect(products.count).to eq(2)
    expect(products.first['name']).to eq("Chocolate Bar")
    expect(products.first['price']).to eq("1.00")
    expect(products.first['warehouse_quantity']).to eq(1000)
    expect(products.first['store_quantity']).to eq(100)
    expect(products.first['expiration']).to eq(
      Product.first.expiration.strftime("%Y-%m-%d"))
  end
end
