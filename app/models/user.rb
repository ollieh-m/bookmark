require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  #validates_presence_of :password_digest
  #validates_presence_of :email
  validates_format_of :email, :as => /^.+@.+\..+$/
  validates_confirmation_of :password
  property :id,       Serial
  property :email,    String, required: true
  property :password_digest, Text, required: true
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
