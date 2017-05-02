
Fabricator(:customer) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  invoices(count: 3)
end
