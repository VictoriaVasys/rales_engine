class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
   def self.revenue
     unit_price * quantity 
   end
  # validates :quantity, presence: true
  # validates :unit_price, presence: true
end
