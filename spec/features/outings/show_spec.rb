require "rails_helper"

RSpec.describe "Outing" do
  before :each do
  @bach1 = Bachelorette.create!(name: "Michelle Young", season_number: 18, description: "Who will be the lucky guy?")
  @bach2 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most thrilling season yet!")
  @bach3 = Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, description: "A nail biter")

  @cont1 = @bach1.contestants.create!(name: "Brandon Jones", age: 26, hometown: "Portland, Oregon")
  @cont2 = @bach1.contestants.create!(name: "Rick Leach", age: 32, hometown: "Munroe Falls, Ohio")
  @cont3 = @bach2.contestants.create!(name: "Jed Wyatt", age: 2, hometown: "Sevierville, Tennessee")
  @cont4 = @bach2.contestants.create!(name: "Mike Johnson", age: 31, hometown: "San Antonio, Texas")
  @cont5 = @bach2.contestants.create!(name: "Devin Harris", age: 27, hometown: "Sherman Oaks, California")
  @cont6 = @bach2.contestants.create!(name: "Hunter Jones", age: 24, hometown: "Westchester, California")
  @cont7 = @bach3.contestants.create!(name: "Lee Garrett", age: 30, hometown: "Jacksonville, Florida")
  @cont8 = @bach3.contestants.create!(name: "Fred Johnson", age: 27, hometown: "Dallas, Texas")
  @cont9 = @bach3.contestants.create!(name: "Rob Howard", age: 30, hometown: "Calgary, Alberta")

  @out1 = Outing.create!(name: "Skiing", location: "Keystone Mountain", date: '12/12/2020')
  @out2 = Outing.create!(name: "Helicopter Ride", location: "Yosemite", date: '06/12/2020')
  @out3 = Outing.create!(name: "Mountain Biking", location: "Moab", date: '10/10/2020')
  @out4 = Outing.create!(name: "Snorkeling", location: "Bahamas", date: '06/22/2020')
  @out5 = Outing.create!(name: "Cooking Lesson", location: "Le Cordon Bleu", date: '01/01/2021')

  ContestantOuting.create!(contestant: @cont1, outing: @out1)
  ContestantOuting.create!(contestant: @cont2, outing: @out1)
  end
  it "US4: shows outings name, location, date, total count of contestants on outing and their names" do
    # User Story 4 of 7 - Outings Show Page
    # As a visitor,
    # When I visit an outings show page,
    # I see that outings name, location, and date
    # And I see a total count of contestants that were on this outing
    # And I see a list of all names of the contestants that went on this outing
    
    # (e.g.       Helicopter Ride
    #             Location: Bali
    #             Date: 09/12/19
    #           Count of Contestants: 3
    # Contestants: JoJo Fletcher, Kaitlyn Bristowe, Hannah Brown)
    visit "/outings/#{@out1.id}"
    expect(page).to have_content(@out1.name)
    expect(page).to have_content(@out1.location)
    expect(page).to have_content(@out1.date)
    expect(page).to have_content(@cont1.name)
    expect(page).to have_content(@cont2.name)
  end
end