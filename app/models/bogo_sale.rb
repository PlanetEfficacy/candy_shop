class BogoSale < ApplicationRecord
  validates_presence_of :status

  belongs_to :product
end
