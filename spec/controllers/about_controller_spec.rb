require 'rails_helper'

RSpec.describe AboutController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #news" do
    it "returns http success" do
      get :news
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #organization" do
    it "returns http success" do
      get :organization
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #history" do
    it "returns http success" do
      get :history
      expect(response).to have_http_status(:success)
    end
  end

end
