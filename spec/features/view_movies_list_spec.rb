require 'rails_helper'

feature "User can see list of movies" do
  # As an authenticated user
  # I want to view a list of movies
  # So that I can choose a movie to review
  # Acceptance Criteria
  # - I should be logged to the site
  # - I should be able to see a list of all movies that have been submitted
  # - I should get to this list form the site index
  # As an authenticated user
  # I want to view the details about a movie
  # So that I can get more information about it
  # Acceptance Criteria
  # - I should not be logged into the site
  # - I should be able to view the details of a movie
  # - I should get to this detail page by clicking on the name of the movie
  # As an unauthenticated user
  # I want to view a list of movies
  # So that I view the most popular movies
  # Acceptance Criteria
  # - I should not be logged into the site
  # - I should be able to see a list of all movies that have been submitted
  # - I should get to this list form the site index


  scenario "shows visitor list of movies" do
    guardians_of_the_galaxy = Movie.create(name: 'Guardians of the Galaxy', description: "A story")
    visit movies_path
    expect(page).to have_text("Movies")
    expect(page).to have_content(guardians_of_the_galaxy.name)
  end

  scenario "signed in user views movies list" do
    guardians_of_the_galaxy = Movie.create(name: 'Guardians of the Galaxy', description: "A story")
    user = FactoryGirl.create(:user)
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    visit movies_path
    expect(page).to have_text("Movies")
    expect(page).to have_content(guardians_of_the_galaxy.name)
  end
end
