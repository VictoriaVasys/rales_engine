class Api::V1::Items::FindController < ApplicationController
  def index
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round
    end
    find_all_params(item_params.keys.first)
  end

  def show
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round
    end
    find_params(item_params.keys.first)
  end
  
  private
  def find_params(attribute)
    render json: Item.find_by("#{attribute}": params[:"#{attribute}"])
  end
  
  def find_all_params(attribute)
    render json: Item.where("#{attribute}": params[:"#{attribute}"])
  end
  
  def item_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  end
end