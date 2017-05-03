feature 'Filtering links' do
  scenario 'Can filter links by tag' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.create(name: 'search')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.create(name: 'bubbles')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.create(name: 'bubbles')])

    visit "/tags/bubbles"

    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Code.org')
    expect(page).to have_content('This is Zombocom')
    expect(page).to have_content('Bubble Bobble')
  end
end
