require 'rails_helper'

describe "GET /api/v1/products/total", type: :request do
  it "returns the total value of all unexpired products in inventory" do
    expired_product = create :expired_product
    unexpired_product = create :product
    inedible_product = create :inedible_product

    get '/api/v1/products/total'
    value = JSON.parse(response.body)

    expect(response).to be_success
    expect(value).to be_instance_of(Hash)
    expect(value['total_value']).to eq(220000)
  end
end
