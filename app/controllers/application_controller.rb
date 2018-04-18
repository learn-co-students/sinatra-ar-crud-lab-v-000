
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    #get info from params to post to index / create a new instance of post class!
    erb :index
  end

  get '/posts' do
    #@posts will get all of the posts
    erb :index
  end

  get '/posts/:id' do
    # This action should use Active Record to grab the post with the id that is in
    # the params and set it equal to @post.
    erb :show
  end


end
