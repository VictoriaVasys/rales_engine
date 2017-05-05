class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.top_merchants(params[:quantity])
  end

  def show
    if params['date']
      render json: Merchant.find(params[:merchant_id]).revenue(invoices: {created_at: params['date']}), serializer: RevenueSerializer
    else
      render json: Merchant.find(params[:merchant_id]).revenue, serializer: RevenueSerializer
    end
  end

end
