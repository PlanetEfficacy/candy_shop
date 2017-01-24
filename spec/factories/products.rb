FactoryGirl.define do
  factory :product do
    name "Chocolate Bar"
    unit_price 100
    warehouse_quantity 1000
    store_quantity 100
    expiration Date.parse(Time.now.to_s)
  end
end
