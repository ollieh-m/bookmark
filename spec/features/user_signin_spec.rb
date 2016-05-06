feature 'user signin' do

  scenario 'user successfully signs in and gets a welcome message' do
    sign_up
    visit('/sessions/new')
    fill_in('email', with: 'user@example.com')
    fill_in('password', with: 'password1')
    click_button('Sign in')
    expect(page).to have_content('Welcome user@example.com')
  end

end