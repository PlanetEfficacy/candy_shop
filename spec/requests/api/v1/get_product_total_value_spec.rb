require 'rails_helper'

describe "GET /api/v1/products/:id/total", type: :request do
  it "returns the total value of the product matching the id" do
    product = create :product

    get "/api/v1/products/total?id=#{product.id}"
    value = JSON.parse(response.body)

    expect(response).to be_success
    expect(value).to be_instance_of(Hash)
    expect(value['total_value']).to eq(110000)
  end
end
