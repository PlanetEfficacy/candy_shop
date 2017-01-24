require 'rails_helper'

describe "POST /sales", type: :request do
  context "with sale percent in body" do
    it "returns the product with sale price as json" do
      original_product = create :product, unit_price: 10000

      post "/api/v1/sale", { product: original_product.id, sale: 50 }
      product = JSON.parse(response.body)

      expect(response).to be_success
      expect(product).to be_instance_of(Hash)
      expect(product['id']).to eq(original_product.id)
      expect(product['price']).to eq(5000)
    end
  end
end
