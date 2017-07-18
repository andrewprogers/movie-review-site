require 'rails_helper'

feature "User Signs Out" do
  # As an authenticated user
  # I want to be able to sign out
  # So that no one else can post a movie or review on my behalf
  #
  # Acceptance Criteria:
  # If a user is signed in, they should see
  # a link to sign out on the banner of the page
  # Clicking on the link should sign the user out of the site immediately
  # Once signed out, their username should not be displayed anymore
  # If the user is not signed in, they won’t see the link to sign out

  scenario "Authenticated user signs out" do
    user = FactoryGirl.create(:user)
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")

    visit(root_path)
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
    expect(page).to_not have_content(user.username)
  end

  scenario "unauthenticated user attempts to sign out" do
    visit(root_path)
    expect(page).to_not have_content("Sign Out")
  end
end
