class Api::V1::ProductsController < ApplicationController
  def index
    if params[:sort_by] == "price"
      products = Product.sort_by_price
    else
      products = Product.all
    end
    render json: products
  end
end
