class Api::V1::ProductsController < ApplicationController
  def index
    render json: sort_requested? ? order_products : Product.unexpired
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    render json: product
  end

  private
    def product_params
      params.permit(:warehouse_quantity, :store_quantity)
    end

    def order_products
      return Product.sort_by_price if sort_by_price?
      return Product.sort_by_warehouse if sort_by_warehouse?
      return Product.sort_by_store if sort_by_store?
    end

    def sort_by_price?
      params[:sort_by].downcase == "price"
    end

    def sort_by_warehouse?
      params[:sort_by].downcase == "warehouse"
    end

    def sort_by_store?
      params[:sort_by].downcase == "store"
    end

    def sort_requested?
      !!params[:sort_by]
    end
end
