require 'rails_helper'

describe "Invoice relations API" do
  it "returns all transactions associated with an invoice" do
    id = Fabricate(:invoice).id
    get "/api/v1/invoices/#{id}/transactions"
    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end
end
