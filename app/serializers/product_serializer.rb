class ProductSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :price,
              :warehouse_quantity,
              :store_quantity,
              :expiration,
              :bogo_sale

  def price
    "#{'%.2f' % object.sale_price}"
  end

  def expiration
    object.expiration.strftime("%Y-%m-%d")
  end
end
