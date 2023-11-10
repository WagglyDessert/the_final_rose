require "rails_helper"

RSpec.describe "Bachelorette" do
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
  end

  it "US1: shows bachelorette information" do
  #  User Story 1 of 7 - Bachelorette Show Page & Bachelorette's Contestants Index
  # As a visitor,
  # When I visit '/bachelorettes/:id',
  # I see that bachelorette's:
  # -Name
  # -Season Number
  # -Description of Season that they were on
  # (e.g.             
  #                   Hannah Brown
  #     Season 15 - The Most Dramatic Season Yet!
  #   )
  # I also see a link to see that bachelorette's contestants
  # When I click on that link
  # I'm taken to "/bachelorettes/:bachelorette_id/contestants"
  # and I can see only that bachelorette's contestants
    visit "/bachelorettes/#{@bach1.id}"
    expect(page).to have_content(@bach1.name)
    expect(page).to have_content(@bach1.season_number)
    expect(page).to have_content(@bach1.description)
    expect(page).to have_link("#{@bach1.name}'s Contestants")
    click_link("#{@bach1.name}'s Contestants")
    expect(current_path).to eq("/bachelorettes/#{@bach1.id}/contestants")
    expect(page).to have_content(@cont1.name)
    expect(page).to have_content(@cont2.name)
    expect(page).to_not have_content(@cont3.name)
    expect(page).to_not have_content(@cont4.name)
    expect(page).to_not have_content(@cont5.name)
  end
end