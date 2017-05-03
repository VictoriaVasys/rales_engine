require 'rails_helper'

describe "Items relations API" do

  it "returns the associated invoice_items" do
    item = Fabricate(:invoice_item).item #fabricator is shitty
    get "/api/v1/items/#{item.id}/invoice_items"
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count). to eq(1)
  end

  it "returns the associated merchant" do
    item = Fabricate(:item)
    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(merchant["id"]). to eq(item.merchant.id)
  end
end
