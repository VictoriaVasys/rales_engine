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
  it "can find one customer by its customer_id" do
    customer_id = Fabricate(:customer).id

    get "/api/v1/customers/find?id=#{customer_id}"
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["id"]).to eq(customer_id)
  end
  it "can find one customer by its first_name" do
    first_name = Fabricate(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end
  it "can find one customer by its last_name" do
    last_name = Fabricate(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["last_name"]).to eq(last_name)
  end
  


end
