feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
  scenario 'confirmation of password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password and confirmation password do not match')
  end
  scenario "can't sign up without an email address" do
    expect { sign_up(email:nil, password:nil) }.not_to change(User, :count)
  end
  scenario "can't sign up with an invalid email address" do
    expect { sign_up(email:"invalid@email") }.not_to change(User, :count)
    expect { sign_up(email:"invalidemail.") }.not_to change(User, :count)
  end
end
