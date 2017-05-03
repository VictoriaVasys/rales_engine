class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :status, :customer_id, :merchant_id

  # def customer
  #   {id: object.customer.id}
  # end
  #
  # def merchant
  #   {id: object.merchant.id}
  # end
  #
  # def invoice_items
  #   object.invoice_items.map do |invoice_item|
  #     {id: invoice_item.id}
  #   end
  # end
  # def transactions
  #   object.transactions.map do |transaction|
  #     {id: transaction.id}
  #   end
  # end
  # def items
  #   object.items.map do |item|
  #     {id: item.id}
  #   end
  # end


end
