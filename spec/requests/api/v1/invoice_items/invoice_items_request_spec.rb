require 'rails_helper'

describe "Invoice Item API" do
  it "sends a list of invoice_items" do
    Fabricate(:invoice_item)

    get '/api/v1/invoice_items'

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(25)
  end

  it "can get one invoice_item by its id" do
    id = Fabricate(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end
  
  it "can find one invoice_item by its id" do
    id = Fabricate(:invoice_item).id
    
    get "/api/v1/invoice_items/find?id=#{id}"
    invoice_item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end
  
  it "can find one invoice_item by its invoice_id" do
    invoice_id = Fabricate(:invoice_item).invoice_id

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_id}"
    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item["invoice_id"]).to eq(invoice_id)
  end
  
  it "can find one invoice_item by its item_id" do
    item_id = Fabricate(:invoice_item).item_id

    get "/api/v1/invoice_items/find?item_id=#{item_id}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item['item_id']).to eq(item_id)
  end
  
  it "can find one invoice_item by its quantity" do
    quantity = Fabricate(:invoice_item).quantity

    get "/api/v1/invoice_items/find?quantity=#{quantity}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["quantity"]).to eq(quantity)
  end
  
  it "can find one invoice_item by its unit_price" do
    unit_price = Fabricate(:invoice_item).unit_price

    get "/api/v1/invoice_items/find?unit_price=#{unit_price.to_f/100}"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["unit_price"]).to eq((unit_price.to_f/100).to_s)
  end
  
  it "can find all invoice_items by item_id" do
    merchant = Merchant.create(name: "hi")
    customer_id = (Customer.create(first_name: "hii", last_name: "hi hi")).id
    item = merchant.items.create(name: "blah", description: "blah blah", unit_price: 3829)
    invoice_id = (merchant.invoices.create(status: "blah", customer_id: customer_id)).id
    item.invoice_items.create(quantity: 2, unit_price: 3829, invoice_id: invoice_id)
    item.invoice_items.create(quantity: 3, unit_price: 829, invoice_id: invoice_id)
    
    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(2)
  end
  
  it "can find a random invoice_item" do
    Fabricate(:invoice_item)
    
    get "/api/v1/invoice_items/random"

    expect(response).to be_success
  end

end
