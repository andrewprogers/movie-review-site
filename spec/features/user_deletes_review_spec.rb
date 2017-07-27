require 'rails_helper'

feature 'user deletes a review' do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, body: 'delete me', movie: movie1, user: user1) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'authenticated user deletes review successfully' do
    login_as(user1)
    visit movie_path(movie1.id)
    click_link('Delete Review')

    expect(page).to have_content('Review successfully deleted')
    expect(page).to have_content(movie1.name)
    expect(page).to_not have_content(review1.body)
  end

  scenario 'unauthenticated users cant delete review' do
    visit movie_path(movie1.id)

    expect(page).to have_content(review1.body)
    expect(page).to_not have_content('Delete Review')
  end

  scenario 'authenticated users cant delete reviews of other users' do
    login_as(user2)
    visit movie_path(movie1.id)

    expect(page).to have_content(review1.body)
    expect(page).to_not have_content('Delete Review')
  end

  scenario "all associated votes are deleted when a review is deleted" do
    login_as(user1)
    movie1 = FactoryGirl.create(:movie, user_id: user1.id)
    review1 = FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id)
    vote1 = FactoryGirl.create(:vote, review: review1, user: user1)
    visit movie_path(movie1)

    click_link 'Delete Review'
    expect(Movie.where(id: movie1.id).length).to eq(1)
    expect(Review.where(id: review1.id).length).to eq(0)
    expect(Vote.where(id: vote1.id).length).to eq(0)
  end
end
