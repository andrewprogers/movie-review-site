require 'rails_helper'

feature "user can search for a movie" do
  let!(:movie1) { FactoryGirl.create(:movie, name: "Super Troopers 2") }
  let!(:movie2) { FactoryGirl.create(:movie, name: "Moana") }
  scenario "user searches for movie"  do
    visit movies_path
    expect(page).to have_content "Super Troopers 2"
    expect(page).to have_content "Moana"
    fill_in("search", with: "Troopers")
    click_button "Search"
    expect(page).to have_content "Super Troopers 2"
    expect(page).to_not have_content "Moana"
  end
end
