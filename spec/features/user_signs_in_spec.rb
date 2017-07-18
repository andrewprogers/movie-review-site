require 'rails_helper'

feature "User Signs In" do
  # As an unauthenticated user
  # I want to be able to sign in
  # So that I can post items and review them
  #
  # Acceptance Criteria:
  # If a user is not signed in, they should see a link to sign in on every page
  # Clicking on the sign in link will take them to a form to sign in
  # They will be required to fill in information for a valid user
  # If they supply invalid credentials, they should be given an error message and
  # remain on the same page
  # If they supply valid credentials, they should be given a notice that they
  # have successfully signed in
  # Once signed in, their username should be displayed on the banner.

  scenario "User views the sign in page" do
    visit(root_path)
    click_link 'Sign In'

    expect(page).to have_content("Log In")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "User signs in with valid credentials" do
    user = FactoryGirl.create(:user)
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content("Sign In")
    expect(page).to_not have_content("Sign Up")
    expect(page).to have_content(user.username)
  end

  scenario "User signs in with invalid credentials" do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: "junk_username")
    fill_in("Password", with: "junk_password")
    click_button("Log in")
    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Welcome")
  end
end
