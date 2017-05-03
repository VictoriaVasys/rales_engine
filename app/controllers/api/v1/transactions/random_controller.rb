class Api::V1::Transactions::RandomController < ApplicationController

  def show
    render json: Merchant.random
  end

end
