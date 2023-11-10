require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it { should have_many(:contestant_outings) }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe '#contestant_count' do
    it 'will count contestants on an outing' do
      test_data
      expect(@out1.contestant_count).to eq(2)
    end
  end
end