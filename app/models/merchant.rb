class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def revenue(date = nil)
    "%.2f" % (invoices.joins(:transactions, :invoice_items).
    merge(Transaction.succesful).
    where(date).
    sum('invoice_items.quantity * invoice_items.unit_price').to_f/100)
  end

  def self.top_merchants(quantity)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue").
    joins(invoices: [:invoice_items, :transactions]).
    merge(Transaction.succesful).
    order('revenue DESC').
    group(:id).
    limit(quantity)
  end
  
  def self.top_merchants_by_items(quantity)
    find_by_sql(["
      SELECT merchants.*, sum(invoice_items.quantity) AS items_sold 
      FROM merchants 
      JOIN invoices 
      ON merchants.id = invoices.merchant_id 
      JOIN invoice_items 
      ON invoices.id = invoice_items.invoice_id 
      JOIN transactions 
      ON invoices.id = transactions.invoice_id 
      WHERE transactions.result = 'success' 
      GROUP BY merchants.id 
      ORDER BY items_sold DESC LIMIT ?;", quantity])
  end
  
  def self.customers_with_pending_invoices(merchant_id)
    sql =Customer.find_by_sql(["
      SELECT customers.* FROM customers
      JOIN invoices 
      ON invoices.customer_id = customers.id
      JOIN transactions 
      ON invoices.id = transactions.invoice_id
      JOIN merchants 
      ON invoices.merchant_id = merchants.id
      WHERE merchants.id = ?
      AND transactions.result = 'failed'
      EXCEPT
      SELECT customers.* FROM customers
      JOIN invoices 
      ON invoices.customer_id = customers.id
      JOIN transactions 
      ON invoices.id = transactions.invoice_id
      JOIN merchants 
      ON invoices.merchant_id = merchants.id
      WHERE merchants.id = ?
      AND transactions.result = 'success'
      GROUP BY customers.id;", merchant_id, merchant_id])
  end

  def favorite_customer
    customers.select('customers.*').joins(:transactions).merge(Transaction.succesful).group(:id).order('count(transactions.id) DESC').first
  end
end
