require 'rails_helper'

# I need an easy way to be able to view all of my products.
# This list of products needs to show me the price, quantity
# available to ship, and quantity distributed to my Al's
# Candies™ stores. It would also be nice to be able to sort
# by those attributes as well.
describe "GET /products", type: :request do
  xit "returns price, quantity of all products" do
    create_list :product, 2

    get "/products"
    products = JSON.parse(response.body)

    expect(response).to be_success
    expect(products).to be_instance_of(Array)
    expect(products.count).to eq(2)
    expect(products.first[:price]).to eq(1000)
  end
end
