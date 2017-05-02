require 'rails_helper'

describe "Invoice API" do
  it "sends a list of invoices" do
    Fabricate.times(3, :invoice)

    get '/api/v1/invoices'

    expect(response).to be_success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end

  it "can get one item by its id" do
    id = Fabricate(:invoice).id

    get "/api/v1/invoices/#{id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
end