require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
  	erb :new
  end

  post '/posts' do
  	@new_post = Post.create(params)
    @posts = Post.all
  	erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/' do 
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    new_post = {}
    new_post[:name] = params["name"]
    new_post[:content] = params["content"]
    new_post[:id] = params["id"]
    @post = Post.update(new_post[:id],new_post)
    erb :show
  end

  delete '/posts/:id/delete' do
    old_post = Post.find(params[:id].to_i)
    @name = old_post.name
    old_post.destroy
    erb :delete
  end

end