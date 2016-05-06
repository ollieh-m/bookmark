require 'bcrypt'

class User
  
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
    
  property :id, Serial 
  property :email,  String, required: true, unique: true
  property :password_hash, Text

  def password=(actual_password)
 	@password = actual_password
    self.password_hash = Password.create(actual_password)
  end

  validates_confirmation_of :password
  validates_format_of :email, with: /[a-zA-Z_\.]+@[a-zA-Z_\.]+(\.com)|(\.co\.uk)|(\.org)|(\.net)/

end
