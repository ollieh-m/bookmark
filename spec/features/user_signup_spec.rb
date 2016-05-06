feature 'user signup' do

  scenario 'successfully signing up a user' do
    visit('/users')
    fill_in('email', with: 'user@example.com')
    fill_in('password', with: 'password1')
    fill_in('password_confirmation', with: 'password1')
    click_button('Sign up')
    expect(User.all.count).to eq 1
    expect(User.first.email).to eq('user@example.com')
    expect(page).to have_content('Welcome user@example.com')
  end

  scenario 'providing a password confirmation that does not match the password' do
    visit('/users')
    fill_in('email', with: 'user@example.com')
    fill_in('password', with: 'password1')
    fill_in('password_confirmation', with: 'password2')
    click_button('Sign up')
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
    expect(User.all.count).to eq 0
  end

  scenario 'failing to provide an email address when signing up' do
    visit('/users')
    fill_in('password', with: 'password1')
    fill_in('password_confirmation', with: 'password1')
    click_button('Sign up')
    expect(User.all.count).to eq 0
  end

  scenario 'failing to provide an email address in a valid format' do
    visit('/users')
    fill_in('email', with: 'user@example')
    fill_in('password', with: 'password1')
    fill_in('password_confirmation', with: 'password1')
    click_button('Sign up')
    expect(User.all.count).to eq 0
  end

end