feature 'add tag to the link' do
	scenario 'tag links' do
		visit '/links/new'
		fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://facebook.com'
    fill_in :tag, with: 'community'
    click_button 'Submit'

    expect(page).to have_content('community')
	end
end