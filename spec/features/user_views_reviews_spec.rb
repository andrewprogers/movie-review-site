require 'rails_helper'

feature "user views reviews for a movie" do
  scenario "user sees list of reviews for a movie" do
    movie = FactoryGirl.create(:movie)
    review1 = FactoryGirl.create(:review, movie: movie)
    review2 = FactoryGirl.create(:review, movie: movie)

    visit(movie_path(movie.id))
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.user.username)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(review2.body)
    expect(page).to have_content(review2.user.username)
  end

  scenario 'user only sees review specific to that movie' do
    movie = FactoryGirl.create(:movie)
    review1 = FactoryGirl.create(:review, movie: movie)
    review2 = FactoryGirl.create(:review, body: 'different body')

    visit(movie_path(movie.id))
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(review1.user.username)

    expect(page).to_not have_content(review2.body)
    expect(page).to_not have_content(review2.user.username)
  end
end
