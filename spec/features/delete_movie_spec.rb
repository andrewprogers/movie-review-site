require 'rails_helper'

feature "Signed in User can delete a movie" do

  # Delete
  # As an authenticated user
  # I want to delete an item
  # So that no one can review it
  # Acceptance Criteria
  # - I should be logged to the site
  # - I should be able to view the details of a movie
  # - I should get to this detail page by clicking on the name of the movie
  # - I should be able to delete the movie and all associated reviews by clicking the 'Delete'
  # button
  # - Upon completion of the delete I should receive a confirmation message that the movie has
  # been deleted and redirect the main movies page
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    click_link('Edit Profile')
    click_link "Add Movie"
    fill_in("Name", with: "The Garbage Pail Kids Movie")
    fill_in("Description", with: "A shite movie")
    click_button "Add Movie"
    visit movies_path
    click_link "The Garbage Pail Kids Movie"
    click_link "Edit Movie"
  end

  scenario 'authenticated user successfully deletes movie' do
    click_button 'Delete Movie'

    expect(page).to have_content('Movie Deleted')
    expect(page).to_not have_content("The Garbage Pail Kids Movie")
  end
end
