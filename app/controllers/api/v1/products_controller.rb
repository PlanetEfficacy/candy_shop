class Api::V1::ProductsController < ApplicationController
  def index
    render json: sort_requested? ? order_products : Product.all
  end

  private
    def order_products
      return Product.sort_by_price if sort_by_price?
      return Product.sort_by_warehouse if sort_by_warehouse?
    end

    def sort_by_price?
      params[:sort_by] == "price"
    end

    def sort_by_warehouse?
      params[:sort_by] == "warehouse"
    end

    def sort_requested?
      !!params[:sort_by]
    end
end
