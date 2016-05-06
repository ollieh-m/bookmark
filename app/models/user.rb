require 'bcrypt'

class User
  
  include BCrypt
  include DataMapper::Resource

  attr_reader :password, :password_hash
  attr_accessor :password_confirmation
    
  property :id, Serial 
  property :email,  String, required: true, unique: true
  property :password_hash, Text

  def self.authenticate(email_input,password_input)
    user = self.first(email: email_input)
    if user && Password.new(user.password_hash) == password_input
      user
    else
      false
    end
  end

  def password=(actual_password)
 	  @password = actual_password
    self.password_hash = Password.create(actual_password)
  end

  validates_confirmation_of :password
  validates_format_of :email, with: /[a-zA-Z_\.]+@[a-zA-Z_\.]+(\.com)|(\.co\.uk)|(\.org)|(\.net)/

end
