require 'sinatra/base'
require './models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
  	@links = Link.all
  	erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    Link.create(title: params[:link_title], url: params[:link_url])
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
