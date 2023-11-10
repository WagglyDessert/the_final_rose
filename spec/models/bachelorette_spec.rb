require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  describe '#avg_age_of_contestants' do
    it 'will calculate avg age of contestants' do
      test_data
      expect(@bach1.avg_age_of_contestants).to eq(29)
      expect(@bach2.avg_age_of_contestants).to eq(21)
      expect(@bach3.avg_age_of_contestants).to eq(29)
    end
  end
end
