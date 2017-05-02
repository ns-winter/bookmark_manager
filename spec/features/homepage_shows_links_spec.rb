feature "homepage" do
  scenario "displays links" do
    link = Link.create(title: "Google", url: "www.google.com")
    visit "/"
    expect(page).to have content "Google"
  end
end
