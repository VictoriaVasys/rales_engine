class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def revenue
    (invoices.joins(:transactions, :invoice_items).
    where(transactions: {result: 'success'}).
    sum('invoice_items.quantity * invoice_items.unit_price').to_f/100).round(2).to_s

  end

  def top_merchants(limit = 5)
    select("sum(invoice_items.unit_price * invoice_items.quantity) as revenue").
    joins(invoices: [:invoice_items, :transactions]).
    where(transactions: {result: 'success'})
  end
end
