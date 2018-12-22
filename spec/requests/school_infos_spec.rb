require 'rails_helper'

RSpec.describe "SchoolInfos", type: :request do
  describe "GET /school_infos" do
    it "works! (now write some real specs)" do
      get school_infos_path
      expect(response).to have_http_status(200)
    end
  end
end
