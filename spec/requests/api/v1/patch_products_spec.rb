require 'rails_helper'

describe "PATCH /api/v1/products/:id", type: :request do
  context "with update warehouse body" do
    it "returns the updated product as json" do
      original_product = create :product, warehouse_quantity: 1

      patch "/api/v1/products/#{original_product.id}", { warehouse_quantity: 2 }
      product = JSON.parse(response.body)

      expect(response).to be_success
      expect(product).to be_instance_of(Hash)
      expect(product['id']).to eq(original_product.id)
      expect(product['warehouse_quantity']).to eq(2)
    end
  end

  context "with update store body" do
    it "returns the updated product as json" do
      original_product = create :product, store_quantity: 1

      patch "/api/v1/products/#{original_product.id}", { store_quantity: 2 }
      product = JSON.parse(response.body)

      expect(response).to be_success
      expect(product).to be_instance_of(Hash)
      expect(product['id']).to eq(original_product.id)
      expect(product['store_quantity']).to eq(2)
    end
  end
end
