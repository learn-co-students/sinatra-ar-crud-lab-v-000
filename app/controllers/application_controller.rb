
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do

    erb :'posts/new'
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :'posts/show'
  end

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

end
