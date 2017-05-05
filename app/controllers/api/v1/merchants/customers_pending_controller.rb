class Api::V1::Merchants::CustomersPendingController < ApplicationController

  def index
    render json: Merchant.customers_with_pending_invoices(params[:merchant_id]), each_serializer: CustomersPendingSerializer
  end

end
