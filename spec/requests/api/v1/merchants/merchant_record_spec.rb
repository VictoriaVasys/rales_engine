require 'rails_helper'

describe "Merchant API" do
  it "sends a list of merchants" do
    Fabricate.times(3, :merchant)
    get '/api/v1/merchants'
    expect(response).to be_success
    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = Fabricate(:merchant).id
    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can find one merchant by its merchant_id" do
    merchant_id = Fabricate(:merchant).id
    get "/api/v1/merchants/find?id=#{merchant_id}"
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["id"]).to eq(merchant_id)
  end

  it "can find one merchant by its name" do
    name = Fabricate(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "returns a random record" do
    Fabricate(:merchant)
    get '/api/v1/merchants/random'
    expect(response).to be_success
  end
end
