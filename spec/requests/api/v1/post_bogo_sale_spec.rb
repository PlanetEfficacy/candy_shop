require 'rails_helper'

describe "POST /bogosales", type: :request do
  context "with product in body" do
    it "returns the product with bogo sales status" do
      original_product = create :product, unit_price: 10000

      post "/api/v1/bogosales", { product: original_product.id }
      product = JSON.parse(response.body)

      expect(response).to be_success
      expect(product).to be_instance_of(Hash)
      expect(product['id']).to eq(original_product.id)
      expect(product['price']).to eq('100.00')
      expect(product['bogo_sale']).to eq('true')
    end
  end
end
