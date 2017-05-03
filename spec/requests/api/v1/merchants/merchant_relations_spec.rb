require 'rails_helper'

describe "Merchant relations API" do
  before(:each) do
    @id = Fabricate(:merchant).id
  end
  
  xit "returns all items associated with an merchant" do
    get "/api/v1/merchants/#{@id}/items"
    
    expect(response).to be_success
    
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end
  
  xit "returns all invoices associated with an merchant" do
    get "/api/v1/merchants/#{@id}/invoices"
    
    expect(response).to be_success
    
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end
  
end
