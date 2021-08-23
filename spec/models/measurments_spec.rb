require 'rails_helper'

RSpec.describe Measurment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'associations' do
    it { should belong_to(:measure) }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
  end
end
