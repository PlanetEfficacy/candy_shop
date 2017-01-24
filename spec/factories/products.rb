FactoryGirl.define do
  factory :product do
    name "Chocolate Bar"
    unit_price 100
    warehouse_quantity 1000
    store_quantity 100
    expiration Date.parse(Time.now.to_s)


    factory :product_with_sale do
      after(:create) do |product_with_sale, _ |
        create :sale, product: product_with_sale
      end
    end

    factory :product_with_bogo_sale do
      after(:create) do |product_with_bogo_sale, _ |
        create :bogo_sale, product: product_with_bogo_sale
      end
    end
  end
end
