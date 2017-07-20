# As an authenticated user
# I want to view the details about a movie
# So that I can get more information about it
# Acceptance Criteria
# - I should not be logged into the site
# - I should be able to view the details of a movie
# - I should get to this detail page by clicking on the name of the movie

feature "View Movie" do

  user = FactoryGirl.create(:user)
  gu = Movie.find_or_create_by(name: 'Guardians of the Galaxy', description: "A story", user: user)

  scenario "shows individual movie page" do
    visit movies_path
    click_link "Guardians of the Galaxy"

    expect(page).to have_content gu.name
    expect(page).to have_content gu.description
  end
end
