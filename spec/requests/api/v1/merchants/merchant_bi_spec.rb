require 'rails_helper'

describe "Merchant BI API" do
  it "returns total revenue for a single merchant" do
    merchant = Fabricate(:merchant)
    
    get "/api/v1/merchants/#{merchant.id}/revenue"
    rev = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(rev["revenue"]).to eq("0.00")
  end

  it "returns total revenue for a single merchant by date" do
    merchant = Fabricate(:merchant)
    
    get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-16 11:55:05"
    rev = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(rev["revenue"]).to eq("0.00")
  end

  it "returns favorite customer for a single merchant" do
    invoice = Fabricate(:invoice)
    merchant = invoice.merchant
    customer = invoice.customer
    
    get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    
    expect(response).to be_success
  end

  it "returns top x merchants based on revenue" do
    Fabricate.times(3, :invoice)
    
    get "/api/v1/merchants/most_revenue?quantity=2"
    merchants = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(merchants.count).to eq(2)
  end

  it "returns total revenue for a all merchants by date" do
    Fabricate(:invoice)
    
    get "/api/v1/merchants/revenue?date=#{DateTime.now.strftime("%Y-%m-%d %I:%M:%S")}"
    rev = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(rev["revenue"]).to eq("0.00")
  end
  
  it "returns top x merchants based on number of items sold" do
    Fabricate.times(2, :invoice)
    
    get "/api/v1/merchants/most_items?quantity=2"
    merchants = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(merchants.count).to eq(2)
  end
  
  it "returns customers who have pending invoices" do
    merchant = Fabricate.times(2, :invoice).first.merchant
    
    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    customers = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(customers.count).to eq(2)
  end
  
end
