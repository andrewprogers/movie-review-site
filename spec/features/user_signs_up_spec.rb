require 'rails_helper'

feature "User Signs Up" do
#   As a prospective user
# I want to be able to sign up for an account
# So that I can post movies to be reviewed and post reviews
#
# Acceptance Criteria:
# If a user is not signed in, they should see a link to sign up on every page
# Clicking on the signup link should take them to a form for a new user
# They will be required to input a username, password, and an email address
# If the form is not filled out completely, the user will be shown one or more errors
# If the form is filled out correctly, the user will be informed that they have successfully signed up

  scenario "Unauthenticated user can view sign up form" do
    visit root_path
    click_link "Sign Up"
    expect(page).to have_content("Sign up for an Account")
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("First Name")
    expect(page).to have_content("Last Name")


  end

  scenario "User fills in form successfully" do
    visit root_path
    click_link "Sign Up"
    fill_in("Username", with: "sathvik22")
    fill_in("Email", with: "sathvik@yahoo.com")
    fill_in("Password", with: "sathvik")
    fill_in("Password Confirmation", with: "sathvik")
    fill_in("First Name", with: "Sathvik")
    fill_in("Last Name", with: "Sudireddy")
    click_button("Sign Up")
    expect(page).to_not have_content("error")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "User does not provide all information" do
    visit root_path
    click_link "Sign Up"
    fill_in("Email", with: "sathvik@yahoo.com")
    fill_in("Password", with: "sathvik")
    fill_in("Password Confirmation", with: "sathvik")
    fill_in("First Name", with: "Sathvik")
    fill_in("Last Name", with: "Sudireddy")
    click_button("Sign Up")
    expect(page).to have_content("error")
    expect(page).to have_content("Username can't be blank")
    expect(page).to_not have_content("Welcome! You have signed up successfully.")
  end

  scenario "Password Confirmation does not match" do
    visit root_path
    click_link "Sign Up"
    fill_in("Username", with: "sathvik22")
    fill_in("Email", with: "sathvik@yahoo.com")
    fill_in("Password", with: "sathvik")
    fill_in("Password Confirmation", with: "athvik")
    fill_in("First Name", with: "Sathvik")
    fill_in("Last Name", with: "Sudireddy")
    click_button("Sign Up")
    expect(page).to have_content("error")
    expect(page).to have_content("Password confirmation doesn't match Password")

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
  end


end
