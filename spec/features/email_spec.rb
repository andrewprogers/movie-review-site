require "rails_helper"

feature "email" do
  scenario "review a movie" do
    movie = FactoryGirl.create(:movie)
    user = FactoryGirl.create(:user)

    visit movies_path
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")

    visit movie_path(movie)

    fill_in "Rating", with: "3"
    click_button "Add Review"

    expect(page).to have_content("3")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
