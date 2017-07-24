require 'rails_helper'

feature 'user can vote for a review' do

  let!(:movie) { FactoryGirl.create(:movie) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user2) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link('Sign In')
    fill_in('Email', with: user1.email)
    fill_in('Password', with: user1.password)
    click_button('Log in')
    visit(movie_path(movie.id))
    fill_in('Rating (1-7 stars)', with: 6)
    fill_in("Review (optional)", with: "This was okay")
    click_button("Add Review")
  end

  scenario 'user successfully upvotes a review' do
    expect(page).to have_content('Upvote Count: 0')
    expect(page).to have_content('Downvote Count: 0')
    click_button('Upvote')
    expect(page).to have_content('Upvote Count: 1')
    expect(page).to have_content('Downvote Count: 0')

    click_button('Downvote')
    expect(page).to have_content('Upvote Count: 0')
    expect(page).to have_content('Downvote Count: 1')

    click_button('Downvote')
    expect(page).to have_content('Upvote Count: 0')
    expect(page).to have_content('Downvote Count: 0')
  end

  scenario 'other user also votes' do
    click_button('Upvote')
    click_link('Sign Out')

    click_link('Sign In')
    fill_in('Email', with: user2.email)
    fill_in('Password', with: user2.password)
    click_button('Log in')
    visit(movie_path(movie.id))

    click_button('Upvote')
    expect(page).to have_content('Upvote Count: 2')
    expect(page).to have_content('Downvote Count: 0')

    click_button('Upvote')
    expect(page).to have_content('Upvote Count: 1')
    expect(page).to have_content('Downvote Count: 0')

    click_button('Downvote')
    expect(page).to have_content('Upvote Count: 1')
    expect(page).to have_content('Downvote Count: 1')
  end
end
