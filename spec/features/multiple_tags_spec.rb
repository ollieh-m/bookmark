feature 'multiple tags to the same link' do
	scenario 'multiple tag links' do
		visit '/links/new'
		fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://facebook.com'
    fill_in :tag, with: 'community,social'
    click_button 'Submit'

    visit('/tags/community')
    expect(page).to have_content("http://facebook.com")

    visit('/tags/social')
    expect(page).to have_content("http://facebook.com")
	end
end