require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/measurments", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Measurment. As you add validations to Measurment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    user = User.create( email: "ar@gmail.com", password: "123456")
    measure = Measure.create( user_id: user.id, name: "test measure")
    { measure_id: measure.id, number: 1, user_id: user.id,date: '2021/01/01'}
  }

  let(:invalid_attributes) {
    user = User.create( email: "ara@gmail.com", password: "123456")
    measure = Measure.create( user_id: user.id, name: "testy measure")
    { measure_id: measure.id, number: 1, user_id: 2,date: '2021/01/01'}
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MeasurmentsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Measurment.create! valid_attributes
      get measurments_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      measurment = Measurment.create! valid_attributes
      get measurment_url(measurment), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Measurment" do
        expect {
          post measurments_url,
               params: { measurment: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Measurment, :count).by(1)
      end

      it "renders a JSON response with the new measurment" do
        post measurments_url,
             params: { measurment: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Measurment" do
        expect {
          post measurments_url,
               params: { measurment: invalid_attributes }, as: :json
        }.to change(Measurment, :count).by(0)
      end

      it "renders a JSON response with errors for the new measurment" do
        post measurments_url,
             params: { measurment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        user = User.create( email: "araa@gmail.com", password: "123456")
        measure = Measure.create( user_id: user.id, name: "testu measure")
        { measure_id: measure.id, number: 22, user_id: user.id,date: '2021/01/01'}
      }

      it "updates the requested measurment" do
        measurment = Measurment.create! valid_attributes
        patch measurment_url(measurment),
              params: { measurment: new_attributes }, headers: valid_headers, as: :json
        measurment.reload
        expect(measurment.number).to eq(22)
      end

      it "renders a JSON response with the measurment" do
        measurment = Measurment.create! valid_attributes
        patch measurment_url(measurment),
              params: { measurment: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the measurment" do
        measurment = Measurment.create! valid_attributes
        patch measurment_url(measurment),
              params: { measurment: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested measurment" do
      measurment = Measurment.create! valid_attributes
      expect {
        delete measurment_url(measurment), headers: valid_headers, as: :json
      }.to change(Measurment, :count).by(-1)
    end
  end
end
