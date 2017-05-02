Fabricator(:invoice) do
  status "pending"
  # description { Faker::TwinPeaks.quote}
  customer
  merchant
end
