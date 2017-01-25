class Api::V1::Products::TotalController < ApplicationController
  def index
    product = params[:id] ? Product.find(params[:id]) : Product
    render json: {total_value: product.total_value}
  end
end
