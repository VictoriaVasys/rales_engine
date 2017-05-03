require 'rails_helper'

describe "Invoice_items relations API" do

  it "returns the associated invoice" do
    invoice_item = Fabricate(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["id"]). to eq(invoice_item.invoice.id)
  end

  it "returns the associated item" do
    invoice_item = Fabricate(:invoice_item)
    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]). to eq(invoice_item.item.id)
  end
end
