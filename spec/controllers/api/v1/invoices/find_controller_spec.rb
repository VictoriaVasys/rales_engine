require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, params: {customer_id: 1}
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
