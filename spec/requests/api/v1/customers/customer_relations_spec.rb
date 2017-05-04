require 'rails_helper'

describe "Merchant relations API" do
  before(:each) do
    @id = Fabricate(:customer).id
  end

  it "returns all invoices associated with an customer" do
    get "/api/v1/customers/#{@id}/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end

  it "returns all transactions associated with an customer" do
    get "/api/v1/customers/#{@id}/transactions"

    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(9)
  end

end
