require 'rails_helper'

feature 'user adds a new review' do
# As an authenticated user
# I want to be able to review a movie
# So that I can let others know what I thought
#
# Acceptance Criteria:
#
# User should be on a movie show page and click a link to add a review
# User must be signed in
# The review must have a star rating, and submission without this should result in errors
# The review may optionally have a text body
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:user1) { FactoryGirl.create(:user) }

  scenario 'logged in user views form on movie show page' do
    login_as(user1)
    visit(movie_path(movie1.id))
    expect(page).to have_content("Add a Review")
    expect(page).to have_content("Rating (1-7 stars)")
    expect(page).to have_content("Review (optional)")
  end

  scenario 'unauthenticated user views form on movie show page' do
    visit(movie_path(movie1.id))
    expect(page).to_not have_content("Add a Review")
    expect(page).to_not have_content("Rating (1-7 stars)")
    expect(page).to_not have_content("Review (optional)")
  end

  scenario 'user successfully reviews a movie' do
    login_as(user1)
    visit(movie_path(movie1.id))
    fill_in('Rating (1-7 stars)', with: 6)
    fill_in("Review (optional)", with: "This was okay")
    click_button("Add Review")

    expect(page).to have_content(movie1.name)
    expect(page).to have_content("Rating: 6")
    expect(page).to have_content("This was okay")
  end

  scenario 'user unsuccessfully reviews a movie' do
    login_as(user1)
    visit(movie_path(movie1.id))
    fill_in("Review (optional)", with: "This was okay")
    click_button("Add Review")

    expect(page).to_not have_content("Rating:")
    expect(page).to_not have_content("This was okay")
  end
end
