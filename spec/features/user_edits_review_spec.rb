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
  let!(:review1) { FactoryGirl.create(:review, movie: movie1) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'authenticated user views review edit page' do
    login_as(user1)
    visit root_path
    click_link(movie1.name)
    click_link('Edit Review')

    expect(page).to have_content("Edit Review")
    expect(find_field('Rating (1-7 stars)').value).to have_content(review.rating)
    expect(find_field('Review (optional)').value).to have_content(review.body)
  end

  scenario 'authenticated user edits review successfully' do
    login_as(user1)
    visit root_path
    click_link(movie1.name)
    click_link('Edit Review')

    fill_in('Rating (1-7 stars)', with: 5)
    fill_in('Review (optional)', with: 'Such a better movie')
    click_button('Update Review')

    expect(page).to have_content('Review successfully updated')
    expect(page).to have_content(movie1.name)
    expect(page).to have_content('Such a better movie')
  end

  scenario 'authenticated user tries to submit invalid form' do
    login_as(user1)
    visit root_path
    click_link(movie1.name)
    click_link('Edit Review')

    fill_in('Rating (1-7 stars)', with: '')
    fill_in('Review (optional)', with: 'Such a better movie')
    click_button('Update Review')

    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content(movie1.name)
  end

  scenario 'unauthenticated users cant edit review' do
    expect(current_user).to be_nil
    visit root_path
    click_link(movie1.name)

    expect(page).to have_content(review1.body)
    expect(page).to_not have_content('Edit Review')
  end

  scenario 'authenticated users cant edit reviews of other users' do
    login_as(user2)
    visit root_path
    click_link(movie1.name)

    expect(page).to have_content(review1.body)
    expect(page).to_not have_content('Edit Review')
  end
end
