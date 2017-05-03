feature "Display Links" do

  scenario "Links appear when you go to homepage" do
    DatabaseCleaner.clean
    Link.create(title: "Google", url: "www.google.com")
    visit "/links"
    expect(page).to have_content "Google"
  end
end
