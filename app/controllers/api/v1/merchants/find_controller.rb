class Api::V1::Merchants::FindController < ApplicationController
  def index
    find_all_params(merchant_params.keys.first)
  end

  def show
    find_params(merchant_params.keys.first)
  end

  private
  def find_params(attribute)
    render json: Merchant.find_by("#{attribute}": params[:"#{attribute}"])
  end

  def find_all_params(attribute)
    render json: Merchant.where("#{attribute}": params[:"#{attribute}"])
  end

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
