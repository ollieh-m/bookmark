require 'bcrypt'

class User
  
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
    
  property :id,   		Serial 
  property :email,  	String
  property :password_hash, 	Text

  def password=(actual_password)
 	@password = Password.create(actual_password)
    self.password_hash = @password
  end

  validates_confirmation_of :password

end
