require "rails_helper"

RSpec.describe CourseAttachmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/course_attachments").to route_to("course_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/course_attachments/new").to route_to("course_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/course_attachments/1").to route_to("course_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/course_attachments/1/edit").to route_to("course_attachments#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/course_attachments").to route_to("course_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/course_attachments/1").to route_to("course_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/course_attachments/1").to route_to("course_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_attachments/1").to route_to("course_attachments#destroy", :id => "1")
    end
  end
end
