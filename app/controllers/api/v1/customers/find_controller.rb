class Api::V1::Customers::FindController < ApplicationController
  def index
    find_all_params(customer_params.keys.first)
  end

  def show
    find_params(customer_params.keys.first)
  end

  private
  def find_params(attribute)
    render json: Customer.find_by("#{attribute}": params[:"#{attribute}"])
  end

  def find_all_params(attribute)
    render json: Customer.where("#{attribute}": params[:"#{attribute}"])
  end

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
