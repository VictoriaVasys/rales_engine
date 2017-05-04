class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    render json: Transaction.find_by_sql("select transactions.* from transactions, customers, invoices where transactions.invoice_id = invoices.id and invoices.customer_id = customers.id and customers.id = #{params[:customer_id]}")
  end

end
