require 'rails_helper'

feature "User can see list of movies" do

  scenario "shows visitor list of movies" do
    user = FactoryGirl.create(:user)
    gu = Movie.create(name: 'Guardians of the Galaxy', description: "A story", user: user)
    visit movies_path
    expect(page).to have_text("Movies")
    expect(page).to have_content(gu.name)
  end

  scenario "signed in user views movies list" do
    user = FactoryGirl.create(:user)
    gu = Movie.create(name: 'Guardians of the Galaxy', description: "A story", user: user)
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    visit movies_path
    expect(page).to have_text("Movies")
    expect(page).to have_content(gu.name)
  end
end
