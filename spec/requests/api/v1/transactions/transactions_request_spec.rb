require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    Fabricate(:transaction)

    get '/api/v1/transactions'

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(13)
  end

  it "can get one transaction by its id" do
    id = Fabricate(:transaction).id

    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end
  it "can find one transaction by its result" do
    result = Fabricate(:transaction).result

    get "/api/v1/transactions/find?result=#{result}"
    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction["result"]).to eq(result)
  end
  it "can find one transaction by its result" do
    result = Fabricate(:transaction).result

    get "/api/v1/transactions/find?result=#{result}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['result']).to eq(result)
  end
  it "can find one transaction by its credit_card_number" do
    credit_card_number = Fabricate(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq(credit_card_number)
  end

  it "can find all transactions by result" do
    result = Fabricate(:transaction).result
    get "/api/v1/transactions/find_all?result=#{result}"
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(13)
  end

  it "returns a random record" do
    Fabricate(:transaction)
    get '/api/v1/transactions/random'
    expect(response).to be_success
  end

end
