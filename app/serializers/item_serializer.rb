class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :invoice_items, :invoices, :merchant
end
