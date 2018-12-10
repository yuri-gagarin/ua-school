require "rails_helper"

RSpec.describe IndexPostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/index_posts").to route_to("index_posts#index")
    end

    it "routes to #new" do
      expect(:get => "/index_posts/new").to route_to("index_posts#new")
    end

    it "routes to #show" do
      expect(:get => "/index_posts/1").to route_to("index_posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/index_posts/1/edit").to route_to("index_posts#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/index_posts").to route_to("index_posts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/index_posts/1").to route_to("index_posts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/index_posts/1").to route_to("index_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/index_posts/1").to route_to("index_posts#destroy", :id => "1")
    end
  end
end
