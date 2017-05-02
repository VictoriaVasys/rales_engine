Fabricator(:invoice) do
  status "pending"
  # description { Faker::TwinPeaks.quote}
  customer
  merchant
  transactions(count: 3)
end
