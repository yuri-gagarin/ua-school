require 'rails_helper'

RSpec.describe "CourseAttachments", type: :request do
  describe "GET /course_attachments" do
    it "works! (now write some real specs)" do
      get course_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
