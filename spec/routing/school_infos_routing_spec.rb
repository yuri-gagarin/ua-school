require "rails_helper"

RSpec.describe SchoolInfosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/school_infos").to route_to("school_infos#index")
    end

    it "routes to #new" do
      expect(:get => "/school_infos/new").to route_to("school_infos#new")
    end

    it "routes to #show" do
      expect(:get => "/school_infos/1").to route_to("school_infos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/school_infos/1/edit").to route_to("school_infos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/school_infos").to route_to("school_infos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/school_infos/1").to route_to("school_infos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/school_infos/1").to route_to("school_infos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/school_infos/1").to route_to("school_infos#destroy", :id => "1")
    end
  end
end
