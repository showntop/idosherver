require "rails_helper"

RSpec.describe CampsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/camps").to route_to("camps#index")
    end

    it "routes to #new" do
      expect(:get => "/camps/new").to route_to("camps#new")
    end

    it "routes to #show" do
      expect(:get => "/camps/1").to route_to("camps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/camps/1/edit").to route_to("camps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/camps").to route_to("camps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/camps/1").to route_to("camps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/camps/1").to route_to("camps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/camps/1").to route_to("camps#destroy", :id => "1")
    end

  end
end
