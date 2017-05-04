require 'rails_helper'

describe "Transaction relations API" do

  it "returns invocie associated with an transaction" do
    transaction = Fabricate(:transaction)
    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(transaction.invoice.id)
  end


end
