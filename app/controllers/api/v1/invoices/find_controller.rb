
class Api::V1::Invoices::FindController < ApplicationController
  def index
    find_all_params(invoice_params.keys.first)
  end

  def show
    unless invoice_params.empty?
      find_params(invoice_params.keys.first)
    else
      render json: Invoice.order("RANDOM()").first
    end
  end

  private
  def find_params(attribute)
    render json: Invoice.find_by("#{attribute}": params[:"#{attribute}"])
  end

  def find_all_params(attribute)
    render json: Invoice.where("#{attribute}": params[:"#{attribute}"])
  end

  def invoice_params
    params.permit(:id, :status, :created_at, :updated_at, :merchant_id, :customer_id)
  end
end
