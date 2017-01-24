class Product < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :unit_price
  validates_presence_of :warehouse_quantity
  validates_presence_of :store_quantity
  validates_numericality_of :unit_price
  validates_numericality_of :warehouse_quantity
  validates_numericality_of :store_quantity

  has_many :sales
  has_many :bogo_sales

  def dollar_price
    unit_price / 100.0
  end

  def sale_price
    no_active_sale? ? dollar_price : dollar_price * total_discount
  end

  def bogo_sale
    !bogo_sales.where('status=?', 1).empty?
  end

  def sell_by_date
    expiration - two_weeks
  end

  class << self
    def sort_by_price
      order(unit_price: :desc, name: :asc)
    end

    def sort_by_warehouse
      order(warehouse_quantity: :desc, name: :asc)
    end

    def sort_by_store
      order(store_quantity: :desc, name: :asc)
    end
  end

  private

    def total_discount
      sales.where('status=?', 1).sum(:discount) / 100.0
    end

    def no_active_sale?
      total_discount == 0.0
    end

    def two_weeks
      14 * 24 * 60 * 60
    end
end
