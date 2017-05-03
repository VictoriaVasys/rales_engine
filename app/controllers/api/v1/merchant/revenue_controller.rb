class Api::V1::Merchant::RevenueController < ApplicationController
  def show
    render json: Merchant.find(params[:merchant_id]).revenue
  end
end
