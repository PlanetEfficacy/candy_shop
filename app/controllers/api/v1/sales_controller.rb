class Api::V1::SalesController < ApplicationController
  def create
    Product.find(params[:product]).sales.new(sale_params)
  end

  private

    def sale_params
      params.permit(:discount)
    end
end
