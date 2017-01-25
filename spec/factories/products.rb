FactoryGirl.define do
  factory :product do
    name "Chocolate Bar"
    unit_price 100
    warehouse_quantity 1000
    store_quantity 100
    expiration Time.zone.now + 15 * 24 * 60 * 60


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

    factory :expired_product do
      name "Expired product"
      unit_price 100
      warehouse_quantity 100
      store_quantity 10
      expiration Date.parse(Time.now.to_s)
    end

    factory :inedible_product do
      name "Inedible product"
      expiration nil
    end
  end
end
