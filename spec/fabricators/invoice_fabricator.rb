Fabricator(:invoice) do
  status "pending"
  customer
  merchant
  transactions(count: 3)
  items(count: 3)  
  invoice_items(count: 3)  
end
