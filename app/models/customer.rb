class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  
  def self.favorite_merchant(customer_id)
    find_by_sql(["
      SELECT merchants.*, count(transactions.id) as succesful_transaction 
      FROM merchants 
      JOIN invoices 
      ON merchants.id = invoices.merchant_id 
      JOIN transactions 
      ON invoices.id = transactions.invoice_id 
      JOIN customers 
      ON customers.id = invoices.customer_id 
      WHERE transactions.result = 'success' 
      AND customers.id = ? 
      GROUP BY merchants.id 
      ORDER BY succesful_transaction 
      DESC LIMIT 1;", customer_id])
  end
  
end
