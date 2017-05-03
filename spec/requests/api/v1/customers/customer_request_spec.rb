require 'rails_helper'

describe "Customer API" do
  it "sends a list of customers" do
    Fabricate.times(3, :customer)

    get '/api/v1/customers'

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = Fabricate(:customer).id

    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
  # it "can find one invoice by its customer_id" do
  #   customer_id = Fabricate(:invoice).customer_id
  #
  #   get "/api/v1/invoices/find?customer_id=#{customer_id}"
  #   invoice = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(invoice["customer"]["id"]).to eq(customer_id)
  # end
  # it "can find one invoice by its merchant_id" do
  #   merchant_id = Fabricate(:invoice).merchant_id
  #
  #   get "/api/v1/invoices/find?merchant_id=#{merchant_id}"
  #   invoice = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(invoice['merchant']['id']).to eq(merchant_id)
  # end
  # it "can find one invoice by its status" do
  #   status = Fabricate(:invoice).status
  #
  #   get "/api/v1/invoices/find?status=#{status}"
  #   invoice = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(invoice["status"]).to eq(status)
  # end
  # it "can find one invoice by its id" do
  #   id = Fabricate(:invoice).id
  #
  #   get "/api/v1/invoices/find?id=#{id}"
  #   invoice = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(invoice["id"]).to eq(id)
  # end
  # it "can find all invoices by customer_id" do
  #   id = Fabricate(:customer).id
  #   get "/api/v1/invoices/find_all?customer_id=#{id}"
  #   invoices = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(invoices.count).to eq(3)
  # end

end
