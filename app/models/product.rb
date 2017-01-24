class Product < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :unit_price
  validates_presence_of :warehouse_quantity
  validates_presence_of :store_quantity
  validates_numericality_of :unit_price
  validates_numericality_of :warehouse_quantity
  validates_numericality_of :store_quantity

  def dollar_price
    unit_price / 100.0
  end

  class << self
    def sort_by_price
      order(unit_price: :desc, name: :asc)
    end

    def sort_by_warehouse
      order(warehouse_quantity: :desc, name: :asc)
    end
  end
end
