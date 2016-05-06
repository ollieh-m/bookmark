feature 'links to add the site' do
	scenario 'save links' do
	visit '/links/new'
		fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://facebook.com'
    click_button 'Submit'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
	end
end

