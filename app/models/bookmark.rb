require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Bookmark

  include DataMapper::Resource

  property :id,     Serial
  property :name,   String
  property :url,    String

  has n, :tags, :through => Resource

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!