require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo on signup" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password Confirmation", with: "boomstick!3vilisd3ad"
    fill_in "First Name", with: "Geoooooooorge"
    fill_in "Last Name", with: "Pauuuuuuul"
    fill_in "Username", with: "Tom"
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/photo.jpg"
    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully")
    expect(page).to have_css("img[src*='photo.jpg']")
  end

  scenario "user adds profile photo from edit page" do
    user1 = FactoryGirl.create(:user)
    login_as(user1)
    visit root_path
    click_link "Edit Profile"

    fill_in("Current Password", with: user1.password)
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/photo.jpg"
    click_button "Update"

    expect(page).to have_css("img[src*='photo.jpg']")
  end
end
