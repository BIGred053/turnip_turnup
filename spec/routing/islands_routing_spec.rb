require "rails_helper"

RSpec.describe IslandsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/islands").to route_to("islands#index")
    end

    it "routes to #new" do
      expect(get: "/islands/new").to route_to("islands#new")
    end

    it "routes to #show" do
      expect(get: "/islands/1").to route_to("islands#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/islands/1/edit").to route_to("islands#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/islands").to route_to("islands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/islands/1").to route_to("islands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/islands/1").to route_to("islands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/islands/1").to route_to("islands#destroy", id: "1")
    end
  end
end
