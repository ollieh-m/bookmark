#require '/models/link.rb'

feature 'Viewing Links' do

  scenario 'should show a link when visiting homepage' do
    Link.create(url: 'http://google.com', title: 'Google')
    visit('/links')
      expect(page).to have_content('Google') 
  end

end