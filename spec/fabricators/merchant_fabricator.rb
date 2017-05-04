Fabricator(:merchant) do
  name {Faker::Company.name}
  items(count: 3)
  # description { Faker::TwinPeaks.quote}
end
