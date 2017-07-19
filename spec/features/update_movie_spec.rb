
require 'rails_helper'

feature "Signed in User can edit a movie" do

# Update
# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information
# Acceptance Criteria
# - I should be logged to the site
# - I should be able to view the details of a movie
# - I should get to this detail page by clicking on the name of the movie
# - I should be able to edit the contents of the movie details by clicking the 'Edit' button
# - I should be able to update the movie name
# - Upon completion of the update I should be redirected to the movie detail page


  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    click_link "Add Movie"
    fill_in("Name", with: "Ted")
    fill_in("Description", with: "A story about a lovely teddy bear")
    click_button "Add Movie"
    visit movies_path
    click_link "Ted"
    click_link "Edit Movie"
  end

  scenario 'user gets to the edit page' do

    expect(page).to have_content "Edit Movie"
    expect(page).to have_content "Name"
    expect(page).to have_content "Description"
  end

  scenario "User should see pre-filled form" do
    expect(find_field('Name').value).to eq("Ted")
    expect(find_field('Description').value).to eq("A story about a lovely teddy bear")
  end

  scenario "User successfully edits information" do
    fill_in("Name", with: 'Ted 2')
    fill_in("Description", with: '')
    click_button("Update Movie")

    expect(page).to have_content('Ted 2')
    expect(page).to have_content('Movie has been updated successfully.')
    expect(page).to_not have_content('A story about a lovely teddy bear')
  end

  scenario "User fills in form incorrectly" do
    fill_in("Name", with: '')
    click_button("Update Movie")

    expect(page).to have_content("Name can't be blank")
  end
end
