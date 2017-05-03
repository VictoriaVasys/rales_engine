class Api::V1::Transactions::FindController < ApplicationController
  def index
    find_all_params(transaction_params.keys.first)
  end

  def show
    find_params(transaction_params.keys.first)
  end

  private
  def find_params(attribute)
    render json: Transaction.find_by("#{attribute}": params[:"#{attribute}"])
  end

  def find_all_params(attribute)
    render json: Transaction.where("#{attribute}": params[:"#{attribute}"])
  end

  def transaction_params
    params.permit(:id, :result, :created_at, :updated_at, :credit_card_number, :credit_card_expiration_date, :invoice_id)
  end
end
