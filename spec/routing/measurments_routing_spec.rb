require "rails_helper"

RSpec.describe MeasurmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/measurments").to route_to("measurments#index")
    end

    it "routes to #show" do
      expect(get: "/measurments/1").to route_to("measurments#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/measurments").to route_to("measurments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/measurments/1").to route_to("measurments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/measurments/1").to route_to("measurments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/measurments/1").to route_to("measurments#destroy", id: "1")
    end
  end
end
