ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmark_new'
  end

  post '/add_bookmark' do
    bookmark = Bookmark.new(name: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    bookmark.tags << tag
    bookmark.save
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
