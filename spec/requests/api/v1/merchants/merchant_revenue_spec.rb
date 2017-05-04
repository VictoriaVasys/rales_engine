require 'rails_helper'

describe "Merchant BI API" do
  it "returns total revenue for a single merchant" do
    merchant = Fabricate(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue"
    expect(response).to be_success
    rev = JSON.parse(response.body)
    expect(rev["revenue"]).to eq("0.00")
  end

  it "returns total revenue for a single merchant by date" do
    merchant = Fabricate(:merchant)
    get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-16 11:55:05"
    expect(response).to be_success
    rev = JSON.parse(response.body)
    expect(rev["revenue"]).to eq("0.00")
  end
end
