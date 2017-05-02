Fabricator(:customer) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  # description { Faker::TwinPeaks.quote} 
end