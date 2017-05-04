class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params['date']
      render json: Merchant.find(params[:merchant_id]).revenue(invoices: {updated_at: params['date']}), serializer: RevenueSerializer
    else
      render json: Merchant.find(params[:merchant_id]).revenue, serializer: RevenueSerializer
    end
  end

end
