class Api::V1::Invoices::ItemsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).items
  end
  
end