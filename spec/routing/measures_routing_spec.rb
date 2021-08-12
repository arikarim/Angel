require 'rails_helper'

RSpec.describe MeasuresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/measures').to route_to('measures#index')
    end

    it 'routes to #create' do
      expect(post: '/measures').to route_to('measures#create')
    end
  end
end
