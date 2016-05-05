feature 'user signup' do
  scenario 'successfully signing up a user' do
    visit('/')
    fill_in('email', with: 'user@example.com')
    fill_in('password', with: 'password1')
    click_button('Sign up')
    expect(User.all.count).to eq 1

    expect(page).to have_content('Welcome user@example.com')
  end

end