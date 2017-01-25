class Api::V1::Products::TotalController < ApplicationController
  def index
    render json: {total_value: Product.total_value}
  end
end
