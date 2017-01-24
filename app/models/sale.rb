class Sale < ApplicationRecord
  validates_presence_of :discount
  validates_presence_of :status

  belongs_to :product
end
