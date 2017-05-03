require 'rails_helper'

describe "Invoice relations API" do
  before(:each) do
    @id = Fabricate(:invoice).id
  end
  
  it "returns all transactions associated with an invoice" do
    get "/api/v1/invoices/#{@id}/transactions"
    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end
  
  it "returns all invoice_items associated with an invoice" do
    get "/api/v1/invoices/#{@id}/invoice_items"
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end
  
  it "returns all items associated with an invoice" do
    get "/api/v1/invoices/#{@id}/items"
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end
  
  it "returns customer associated with an invoice" do
    get "/api/v1/invoices/#{@id}/customer"
    expect(response).to be_success
    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(Invoice.find(@id).customer.id)
  end
  
  it "returns merchant associated with an invoice" do
    get "/api/v1/invoices/#{@id}/merchant"
    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(Invoice.find(@id).merchant.id)
  end
  
end
