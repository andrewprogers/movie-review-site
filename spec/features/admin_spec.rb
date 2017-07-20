feature "admin" do
  user = FactoryGirl.create(:user, admin: true)
  other_user = FactoryGirl.create(:user)
  movie = FactoryGirl.create(:movie)

  before(:each) do
    visit(root_path)
    click_link 'Sign In'
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_button("Log in")
  end

  scenario "views a list of users" do
    click_link "All Users"
    expect(page).to have_content("Users List")
    expect(page).to have_content(other_user.username)
    expect(page).to have_content(user.username)
  end

  scenario "can delete a user" do
    click_link "All Users"
    click_button "Delete #{other_user.username}"
    expect(page).to_not have_content(other_user.username)
    expect(page).to have_content("User Deleted")
  end

  scenario "non-admin can't view user list" do
    click_link "Sign Out"
    click_link 'Sign In'
    fill_in("Email", with: other_user.email)
    fill_in("Password", with: other_user.password)
    click_button("Log in")
    visit users_path
    expect(page).to have_content("Sorry, you are not allowed to do this")
  end

  scenario "can delete movie" do
    visit(movie_path(movie.id))
    click_link "Edit Movie"
    click_button "Delete Movie"
    expect(page).to_not have_content(movie.name)
  end
  # will want to implement tests for deleting review once functionality is implemented
end
