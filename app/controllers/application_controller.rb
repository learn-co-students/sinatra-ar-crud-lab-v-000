
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # binding.pry
    @post = Post.create(params)
    @post.save
    @posts = Post.all
    erb :index
  end

end
