require "rails_helper"

RSpec.describe "Bachelorette" do
  before :each do
    test_data
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
  it "US6: shows average age of all bachelorette's contestants" do
    # User Story 6 of 7 - Bachelorette Show Page: Average age
    # As a visitor,
    # When I visit a bachelorette show page
    # I see the average age of all of that bachelorette's contestants
    # (e.g. "Average Age of Contestants: 29.5")
    visit "/bachelorettes/#{@bach1.id}"
    expect(page).to have_content("Average Age of Contestants: 29")
    visit "/bachelorettes/#{@bach2.id}"
    expect(page).to have_content("Average Age of Contestants: 21")
  end
end