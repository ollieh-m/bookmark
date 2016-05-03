feature 'Viewing Links' do

  scenario 'should show a link when visiting homepage' do
    Link.create(url: 'http://google.com', title: 'Google')
    visit('/links')
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end