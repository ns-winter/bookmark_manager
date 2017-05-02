feature 'Adding links' do

  after do
    DatabaseCleaner.clean
  end

  scenario 'adds YouTube link' do
    DatabaseCleaner.clean
    visit '/links/new'
    fill_in 'title', with: 'YouTube'
    fill_in 'url', with: 'www.youtube.com'
    click_button 'Submit'
    expect(page).to have_content 'YouTube'
  end
end
