class Api::V1::SalesController < ApplicationController
  def create
    product = Product.find(params[:product])
    product.sales.create(sale_params)
    render json: product
  end

  private

    def sale_params
      params.permit(:discount)
    end
end
