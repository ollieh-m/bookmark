feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
  scenario 'confirmation of password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    except(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
  end
end
