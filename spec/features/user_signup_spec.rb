feature 'user signup' do

  scenario 'successfully signing up a user' do
    sign_up
    expect(User.all.count).to eq 1
    expect(User.first.email).to eq('user@example.com')
    expect(page).to have_content('Welcome user@example.com')
  end

  scenario 'providing a password confirmation that does not match the password' do
    sign_up(password_confirmation: 'password2')
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
    expect(User.all.count).to eq 0
  end

  scenario 'failing to provide an email address when signing up' do
    sign_up(email: '')
    expect(User.all.count).to eq 0
  end

  scenario 'failing to provide an email address in a valid format' do
    sign_up(email: 'user@example')
    expect(User.all.count).to eq 0
  end

  scenario 'signing in with an email address that is already registered' do
    sign_up
    sign_up
    expect(User.all.count).to eq 1
    expect(page).to have_content('Email is already taken')
  end

end