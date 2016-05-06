require './app/models/user'

describe User do
  it 'returns the user if password is authenticated' do
    user = User.create(email: 'user@example.com', password: 'password1', password_confirmation: 'password1')
    expect(User.authenticate('user@example.com', 'password1')).to eq user
  end
  it 'returns false if the password is not authenticated' do
    user = User.create(email: 'user@example.com', password: 'password1', password_confirmation: 'password1')
    expect(User.authenticate('user@example.com', 'password2')).to eq false
  end
end