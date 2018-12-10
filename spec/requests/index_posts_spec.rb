require 'rails_helper'

RSpec.describe "IndexPosts", type: :request do
  describe "GET /index_posts" do
    it "works! (now write some real specs)" do
      get index_posts_path
      expect(response).to have_http_status(200)
    end
  end
end
