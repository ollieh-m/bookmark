require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
  	links = Link.all
  	@title = links[0].title
  	@url = links[0].url
  	erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
