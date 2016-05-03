feature 'Submitting new link' do
	
  scenario 'adds new link to links page when submitted' do
    visit('/links/new')
    fill_in('link_title', with: 'Facebook')
    fill_in('link_url', with: 'http://facebook.com')
    click_button('Add')
    expect(current_path).to eq '/links'
    within('ul#links') do
    	expect(page).to have_content('Facebook')
    end
  end

end