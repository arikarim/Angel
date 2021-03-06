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

RSpec.describe '/measures', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Measure. As you add validations to Measure, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    user = User.create(email: 'ar@gmail.com', password: '123456')
    { name: 'Microverse', user_id: user.id }
  end

  let(:invalid_attributes) do
    { name: 'Microverse', user_id: 0 }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # MeasuresController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Measure.create! valid_attributes
      get measures_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      measure = Measure.create! valid_attributes
      get measure_url(measure), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Measure' do
        expect do
          post measures_url,
               params: { measure: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Measure, :count).by(1)
      end

      it 'renders a JSON response with the new measure' do
        post measures_url,
             params: { measure: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Measure' do
        expect do
          post measures_url,
               params: { measure: invalid_attributes }, as: :json
        end.to change(Measure, :count).by(0)
      end

      it 'renders a JSON response with errors for the new measure' do
        post measures_url,
             params: { measure: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        user = User.create(email: 'ari@gmail.com', password: '123456')
        { name: 'Microversee', user_id: user.id }
      end

      it 'updates the requested measure' do
        user = User.create(email: 'arii@gmail.com', password: '123456')
        measure = Measure.create! valid_attributes
        patch measure_url(measure),
              params: { measure: new_attributes }, headers: valid_headers, as: :json
        measure.reload
        { name: 'Microversee', user_id: user.id }
      end

      it 'renders a JSON response with the measure' do
        measure = Measure.create! valid_attributes
        patch measure_url(measure),
              params: { measure: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the measure' do
        measure = Measure.create! valid_attributes
        patch measure_url(measure),
              params: { measure: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested measure' do
      measure = Measure.create! valid_attributes
      expect do
        delete measure_url(measure), headers: valid_headers, as: :json
      end.to change(Measure, :count).by(-1)
    end
  end
end
