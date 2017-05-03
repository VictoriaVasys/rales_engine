class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :status, :customer, :merchant, :transactions, :invoice_items, :items
end
