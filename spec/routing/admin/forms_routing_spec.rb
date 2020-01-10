require "rails_helper"

RSpec.describe Admin::FormsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/forms").to route_to("admin/forms#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/forms/new").to route_to("admin/forms#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/forms/1").to route_to("admin/forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/forms/1/edit").to route_to("admin/forms#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/forms").to route_to("admin/forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/forms/1").to route_to("admin/forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/forms/1").to route_to("admin/forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/forms/1").to route_to("admin/forms#destroy", :id => "1")
    end
  end
end
