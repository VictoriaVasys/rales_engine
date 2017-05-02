class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :status, :customer, :merchant
end
