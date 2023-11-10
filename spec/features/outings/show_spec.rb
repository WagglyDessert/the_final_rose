require "rails_helper"

RSpec.describe "Outing" do
  before :each do
    test_data
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
  it "US5: has link next to each contestant name that says remove, removes association from join table" do
    # User Story 5 of 7 - Remove a Contestant from an Outing
    # As a visitor, 
    # When I visit an outings show page, 
    # I see a link next to each contestant's name that says "Remove"
    # When I click that link, I am redirected to the outings show page
    # Where I no longer see the name of that contestant listed. 
    # When I visit a different outings show page with that contestant, 
    # I still see that contestant's name listed.
    visit "/outings/#{@out1.id}"
    expect(page).to have_button("Remove #{@cont1.name}")
    expect(page).to have_button("Remove #{@cont2.name}")
    click_button("Remove #{@cont1.name}")
    expect(current_path).to eq("/outings/#{@out1.id}")
    expect(page).to have_content(@cont2.name)
    expect(page).to_not have_content(@cont1.name)

    visit "/outings/#{@out2.id}"
    expect(page).to have_content(@cont1.name)
  end
end