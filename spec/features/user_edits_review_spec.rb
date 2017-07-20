require 'rails_helper'

feature 'user edits a review' do
  # As an authenticated user
  # I want to be able to edit a movie review
  # So that I can change any typos that may have occurred

  # Acceptance Criteria
  # User should be on a movie show page and click the 'Edit' button next to the review
  # User must be signed in
  # User must be the creator of the review
  # The review must have a star rating, and the edit submission should result in no errors
  # The review may optionally have a text body

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }

  scenario 'authenticated user edits a review successfully' do
    login_as(:user1)
    visit root_path
    click_link(movie1.name)
  end
end
