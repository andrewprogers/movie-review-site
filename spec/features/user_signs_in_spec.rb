require 'rails_helper'

feature "User Signs In" do
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
