ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmark_new'
  end

  post '/add_bookmark' do
    Bookmark.create(name: params[:title], url: params[:url])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
