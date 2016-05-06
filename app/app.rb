ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
	use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash
	set :session_secret, 'super secret'

  helpers do
    def current_user
      if session[:user_id]
        @current_user ||= User.get(session[:user_id])
      else
        @current_user = nil
      end
    end
    def create_user
      @user = User.new(email: params[:email])
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
    end
  end

  #user signup

	get '/users/new' do
    @user = User.new
    erb :'users/new'
	end

	post '/users' do
		create_user
		if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = []
      @user.errors.each do |error|
        flash.now[:errors] << error
      end
      erb :'users/new'
    end
	end

  #user sign in

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash[:errors] = [['Password or email address is wrong']]
      redirect '/sessions/new'
    end
  end

  #user signout

  delete '/sessions' do
    flash[:report] = "Goodbye #{current_user.email}"
    session[:user_id] = nil
    redirect '/links'
  end

  #links

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
  	params[:tag].split(/,\s*/).each do |input_tag|
	  	tag = Tag.first_or_create(tag: input_tag)
	    link.tags << tag
  	end
    link.save
  	redirect '/links'
  end

  #tags

  post '/tag_filter' do
    redirect("/tags/#{params[:tag_filter]}")
  end

  get '/tags/:tag_filter' do
    tag = Tag.first(tag: params[:tag_filter])
    @links = tag.links
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
