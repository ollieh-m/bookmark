feature 'user sign up' do
  # scenario 'user counter increases' do
  #
  # end
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
  # scenario 'check email is in database' do
  #
  # end
end
