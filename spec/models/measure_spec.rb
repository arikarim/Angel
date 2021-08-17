require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'associations' do
    it { should have_many(:measurments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
