class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  
  def self.total_revenue(date)
    total_revenue = self.find_by_sql(["
      SELECT sum(invoice_items.quantity * invoice_items.unit_price) AS revenue
      FROM invoice_items
      JOIN invoices 
      ON invoices.id = invoice_items.invoice_id
      JOIN transactions 
      ON transactions.invoice_id = invoices.id
      WHERE transactions.result = 'success'
      AND invoices.created_at = ?", date])
    { total_revenue: ((total_revenue[0].revenue)/100.00).to_s } if total_revenue[0].revenue
  end
end
