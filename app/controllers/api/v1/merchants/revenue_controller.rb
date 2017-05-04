class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]), serializer: RevenueSerializer
  end

end
