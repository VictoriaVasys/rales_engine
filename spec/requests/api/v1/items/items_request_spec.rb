require 'rails_helper'

describe "Item API" do
  it "sends a list of items" do
    Fabricate.times(3, :item)

    get '/api/v1/items'

    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(12)
  end

  it "can get one item by its id" do
    id = Fabricate(:item).id

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
  
  it "can find one item by its merchant_id" do
    merchant_id = Fabricate(:item).merchant_id

    get "/api/v1/items/find?merchant_id=#{merchant_id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['merchant_id']).to eq(merchant_id)
  end
  
  it "can find one item by its id" do
    id = Fabricate(:item).id

    get "/api/v1/items/find?id=#{id}"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
  
  it "can find one item by its name" do
    name = Fabricate(:item).name
    
    get "/api/v1/items/find?name=#{name}"
    item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end
  
  it "can find one item by its description" do
    description = Fabricate(:item).description
    
    get "/api/v1/items/find?description=#{description}"
    item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(item["description"]).to eq(description)
  end
  
  it "can find one item by its unit_price" do
    unit_price = Fabricate(:item).unit_price
    
    get "/api/v1/items/find?unit_price=#{unit_price.to_f/100}"
    item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(item["unit_price"]).to eq((unit_price.to_f/100).to_s)
  end
  
  it "can find all items by merchant_id" do
    id = Fabricate(:merchant).id
    
    get "/api/v1/items/find_all?merchant_id=#{id}"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end
  
  it "can find a random item" do
    Fabricate(:item)
    
    get "/api/v1/items/random"

    expect(response).to be_success
  end

end
