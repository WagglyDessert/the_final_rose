require "rails_helper"

RSpec.describe "Bachelorette_Contestants" do
  before :each do
    test_data
  end
  it "US2: shows names of contestants and their ages and hometowns and has link for their show page" do
    # User Story 2 of 7 - Bachelorette's Contestants Index
    # As a visitor,
    # When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',
    # I see the names of that bachelorette's contestants along with the following information:
    # -Age
    # -Hometown
    # (e.g. "Name: Pilot Pete, Age: 34, Hometown: Irving, TX")
    # And I can click on any contestants name (as a link) to go to that contestants show page "/contestants/:id"
    visit "/bachelorettes/#{@bach1.id}/contestants"
    expect(page).to have_content(@cont1.name)
    expect(page).to have_content(@cont1.age)
    expect(page).to have_content(@cont1.hometown)
    expect(page).to have_content(@cont2.name)
    expect(page).to have_content(@cont2.age)
    expect(page).to have_content(@cont2.hometown)
    expect(page).to_not have_content(@cont3.name)
    expect(page).to_not have_content(@cont3.hometown)
    expect(page).to_not have_content(@cont4.name)
    expect(page).to_not have_content(@cont5.name)

    expect(page).to have_link(@cont1.name)
    click_link(@cont1.name)
    expect(current_path).to eq("/contestants/#{@cont1.id}")
  end
  it "US7: shows unique list of all the hometowns contestants are from" do
    # User Story 7 of 7 - Bachelorette's Contestants Index: unique hometowns
    # As a visitor,
    # When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',
    # I see a UNIQUE list of all of the hometowns that these contestants are from.
    # (e.g. "These Contestants are from these hometowns: Denver, Aurora, San Diego, Boston")
    visit "/bachelorettes/#{@bach2.id}/contestants"
    expect(page).to have_content(@cont3.hometown)
    expect(page).to have_content(@cont4.hometown)
    expect(page).to have_content(@cont5.hometown)
    expect(page).to have_content(@cont6.hometown)
  end
end