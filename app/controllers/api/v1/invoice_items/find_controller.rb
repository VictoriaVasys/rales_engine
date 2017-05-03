class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round
    end
    find_all_params(invoice_item_params.keys.first)
  end

  def show
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round
    end
    find_params(invoice_item_params.keys.first)
  end
  
  private
  def find_params(attribute)
    render json: InvoiceItem.find_by("#{attribute}": params[:"#{attribute}"])
  end
  
  def find_all_params(attribute)
    render json: InvoiceItem.where("#{attribute}": params[:"#{attribute}"])
  end
  
  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :item_id, :invoice_id)
  end
end