feature "View Movie" do

  user = FactoryGirl.create(:user)
  gu = Movie.find_or_create_by(name: 'Guardians of the Galaxy', description: "A story", user: user)

  scenario "shows individual movie page" do
    visit movies_path
    click_link "Guardians of the Galaxy"

    expect(page).to have_content gu.name
    expect(page).to have_content gu.description
  end
end
