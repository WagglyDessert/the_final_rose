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

  describe '#hometown_list' do
    it 'will show unique list of hometowns for contestants belonging to a bachelorette' do
      test_data
      @cont10 = @bach2.contestants.create!(name: "Big Boy", age: 31, hometown: "Sherman Oaks, California")
      expected_list = [@cont4.hometown, @cont3.hometown, @cont5.hometown, @cont6.hometown]
      expect(@bach2.hometown_list).to eq(expected_list)
    end
  end
end
