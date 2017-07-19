# As an authenticated user
# I want to view the details about a movie
# So that I can get more information about it
# Acceptance Criteria
# - I should not be logged into the site
# - I should be able to view the details of a movie
# - I should get to this detail page by clicking on the name of the movie

feature "View Movie" do
  guardians_of_the_galaxy = Movie.create(name: 'Guardians of the Galaxy', description: "A story")
  scenario "shows individual movie page" do
    visit movies_path
    click_link "Guardians of the Galaxy"

    expect(page).to have_content guardians_of_the_galaxy.name
    expect(page).to have_content guardians_of_the_galaxy.description
  end
end
