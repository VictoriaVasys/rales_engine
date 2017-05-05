class Item < ApplicationRecord
  
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
  
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  
  def self.most_revenue(quantity)
     find_by_sql(["
      SELECT items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue 
      FROM items 
      JOIN invoice_items 
      ON invoice_items.item_id = items.id 
      JOIN invoices 
      ON invoice_items.invoice_id = invoices.id 
      JOIN transactions 
      ON invoices.id = transactions.invoice_id 
      WHERE transactions.result = 'success' 
      GROUP BY items.id 
      ORDER BY revenue 
      DESC LIMIT ?", quantity])
  end
  
  def self.most_items(quantity)
    find_by_sql(["
      SELECT items.*, sum(invoice_items.quantity) AS total_sold 
      FROM items 
      JOIN invoice_items 
      ON invoice_items.item_id = items.id 
      JOIN invoices 
      ON invoice_items.invoice_id = invoices.id 
      JOIN transactions 
      ON invoices.id = transactions.invoice_id 
      WHERE transactions.result = 'success' 
      GROUP BY items.id 
      ORDER BY total_sold 
      DESC LIMIT ?", quantity])
  end
  
  def self.best_day(item_id)
    find_by_sql(["
      SELECT invoices.created_at 
      FROM invoices 
      INNER JOIN invoice_items 
      ON invoice_items.invoice_id = invoices.id 
      INNER JOIN invoice_items invoice_items_invoices_join 
      ON invoice_items_invoices_join.invoice_id = invoices.id 
      INNER JOIN items ON items.id = invoice_items_invoices_join.item_id 
      WHERE (items.id = ?) 
      GROUP BY invoices.created_at 
      ORDER BY sum(invoice_items.quantity) DESC, invoices.created_at DESC
      LIMIT 1;", item_id])
  end
  
end
