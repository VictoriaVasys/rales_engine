Fabricator(:item) do
  name {Faker::Name.first_name}
  description {Faker::Name.last_name}
  unit_price 730298
  merchant
  # invoice_items(count: 3) 
  # invoices(count: 3)  
end