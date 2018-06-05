
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    #binding.pry
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    #binding.pry
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts/:id' do
    @post = Post.find_by(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(params[:id])
    erb :edit
  end

end
