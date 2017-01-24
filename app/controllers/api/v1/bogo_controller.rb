class Api::V1::BogoController < ApplicationController
  def create
    product = Product.find(params[:product])
    product.bogo_sales.create
    render json: product
  end
end
