require 'rails_helper'

feature 'user deletes profile' do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    click_link('Edit Profile')
  end

  scenario 'authenticated user successfully deletes profile' do
    click_button 'Cancel my account'

    expect(page).to have_content('Your account has been successfully cancelled')
    expect(User.exists?(user.id)).to_not eq(true)
  end
end
