require 'rails_helper'

feature "Signed in User can delete a movie" do

  let!(:user) { FactoryGirl.create(:user) }

  scenario 'authenticated user successfully deletes movie' do
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
    click_button 'Delete Movie'

    expect(page).to have_content('Movie Deleted')
    expect(page).to_not have_content("The Garbage Pail Kids Movie")
  end

  scenario "all associated reviews and votes are deleted when a movie is deleted" do
    login_as(user)
    movie1 = FactoryGirl.create(:movie, user_id: user.id)
    review1 = FactoryGirl.create(:review, movie_id: movie1.id, user_id: user.id)
    vote1 = FactoryGirl.create(:vote, review: review1, user: user)
    visit edit_movie_path(movie1)

    click_button 'Delete Movie'
    expect(Movie.where(id: movie1.id).length).to eq(0)
    expect(Review.where(id: review1.id).length).to eq(0)
    expect(Vote.where(id: vote1.id).length).to eq(0)
  end
end
