require 'rails_helper'

feature "User Signs Out" do
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
