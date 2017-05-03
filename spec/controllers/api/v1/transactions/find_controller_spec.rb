require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: {id: 1}
      expect(response).to have_http_status(:success)
    end
  end

end
