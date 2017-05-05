class Api::V1::Merchants::TotalRevenueController < ApplicationController

  def show
    render json: InvoiceItem.total_revenue(params['date'])
  end

end