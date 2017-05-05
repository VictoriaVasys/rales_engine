require 'rails_helper'

describe "Customer BI API" do
  it "returns a merchant where the customer has conducted the most successful transactions" do
    customer = Fabricate(:invoice).customer
    
    get "/api/v1/customers/#{customer.id}/favorite_merchant"
    merchant = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(merchant.count).to eq(1)
  end
  
end