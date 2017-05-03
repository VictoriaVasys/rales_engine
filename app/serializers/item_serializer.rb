class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id
  
  def unit_price
    # ActiveRecord::Base.connection.execute("select cast(invoice_items.unit_price/100 as money) from invoice_items;")
    (object.unit_price.to_f/100).to_s
  end

end
