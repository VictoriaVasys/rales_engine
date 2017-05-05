Fabricator(:item) do
  name {Faker::Name.first_name}
  description {Faker::Name.last_name}
  unit_price { sequence(:unit_price, 39284) }
  merchant
  # invoice_items(count: 3) 
  # invoices(count: 3)  
end