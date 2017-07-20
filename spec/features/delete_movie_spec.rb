require 'rails_helper'

feature "Signed in User can delete a movie" do

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
    click_link('Edit Profile')
    click_link "Add Movie"
    fill_in("Name", with: "The Garbage Pail Kids Movie")
    fill_in("Description", with: "A shite movie")
    click_button "Add Movie"
    visit movies_path
    click_link "The Garbage Pail Kids Movie"
    click_link "Edit Movie"
  end

  scenario 'authenticated user successfully deletes movie' do
    click_button 'Delete Movie'

    expect(page).to have_content('Movie Deleted')
    expect(page).to_not have_content("The Garbage Pail Kids Movie")
  end
end
