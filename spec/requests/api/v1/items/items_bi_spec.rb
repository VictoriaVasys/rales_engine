require 'rails_helper'

describe "Item BI API" do
  it "returns top x items ranked by total revenue generated" do
    Fabricate(:invoice)
    
    get "/api/v1/items/most_revenue?quantity=2"
    items = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(items.count).to eq(2)
  end
  
  it "returns top x items ranked by total number sold" do
    Fabricate(:invoice)
    
    get "/api/v1/items/most_items?quantity=2"
    items = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(items.count).to eq(2)
  end
  
  it "returns the date with the most sales for a given item using the invoice date" do
    item = Fabricate(:invoice).items.first
    
    get "/api/v1/items/#{item.id}/best_day"
    
    expect(response).to be_success
  end
end