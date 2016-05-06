feature 'user signin' do

  scenario 'user successfully signs in and gets a welcome message' do
    sign_up
    sign_in
    expect(page).to have_content('Welcome user@example.com')
  end

end