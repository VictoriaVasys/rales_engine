class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    {revenue: self.joins(
      
      )}
  end
end
