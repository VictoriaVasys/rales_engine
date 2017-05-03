class Api::V1::Items::FindController < ApplicationController
  def index
    find_all_params(item_params.keys.first)
  end

  def show
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