require 'rails_helper'

RSpec.describe IntroController, type: :controller do

  describe "GET #intro" do
    it "returns http success" do
      get :intro
      expect(response).to have_http_status(:success)
    end
  end

end
