require 'rails_helper'

feature "User Edits Profile" do 
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    click_link('Edit Profile')
  end

  scenario "User clicks link to get to edit page" do
    expect(page).to have_content("Edit User")
  end

  scenario "User should see a form to edit profile on edit page" do
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password Confirmation")
    expect(page).to have_content("Current Password")
    expect(page).to have_content("First Name")
    expect(page).to have_content("Last Name")
    expect(page).to have_content("Username")
  end

  scenario "User should see pre-filled form, except for password" do
    expect(find_field('Email').value).to eq(user.email)
    expect(find_field('First Name').value).to eq(user.first_name)
    expect(find_field('Last Name').value).to eq(user.last_name)
    expect(find_field('Username').value).to eq(user.username)
    expect(find_field('Current Password').value).to eq(nil)
    expect(find_field('Password Confirmation').value).to eq(nil)
    expect(find_field('Password').value).to eq(nil)
  end

  scenario "User successfully edits information" do
    fill_in("Email", with: 'blah@hotmail.com')
    fill_in("Password", with: '1234567')
    fill_in("Password Confirmation", with: '1234567')
    fill_in("Current Password", with: user.password)
    fill_in("First Name", with: 'Bobby')
    fill_in("Last Name", with: user.last_name)
    fill_in("Username", with: 'eminem')
    click_button("Update")
    current_user = User.find(user.id)

    expect(page).to have_content('eminem')
    expect(page).to have_content('Your account has been updated successfully.')
    expect(current_user.email).to eq('blah@hotmail.com')
    expect(current_user.valid_password?('1234567')).to be(true)
    expect(current_user.first_name).to eq('Bobby')
  end

  scenario "User fills in form incorrectly" do
    fill_in("Email", with: '')
    fill_in("Password", with: '1234567')
    fill_in("Password Confirmation", with: '1234567')
    fill_in("Current Password", with: '')
    fill_in("First Name", with: 'Bobby')
    fill_in("Last Name", with: user.last_name)
    fill_in("Username", with: '')
    click_button("Update")
    current_user = User.find(user.id)

    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Current password can't be blank")
    expect(page).to have_content("Username can't be blank")
    expect(current_user.first_name).to_not eq('Bobby')
  end
end
