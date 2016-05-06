feature 'user signout' do
	
  scenario 'user signs out and sees a goodbye message' do
    sign_up
    sign_in
    click_button('Sign out')
    expect(page).to have_content('Goodbye user@example.com')
    expect(current_path).to eq '/links'
  end

end