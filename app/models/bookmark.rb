require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Bookmark

  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  property :url,    String

end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!
