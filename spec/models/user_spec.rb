require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:measures) }
  end

  describe 'associations' do
    it { should have_many(:measurments) }
  end
end
