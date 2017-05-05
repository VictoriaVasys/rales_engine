class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: Merchant.top_merchants_by_items(params[:quantity])
  end

end