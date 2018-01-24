require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    redirect to("/posts")
  end

  get '/posts/new' do 
    erb :new
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts' do 
    @posts = Post.all
    encoded_name = params[:deleted]
    @deleted_name = nil
    if encoded_name 
      @deleted_name = URI::decode(encoded_name)
    end
    erb :index
  end

  post '/posts' do
    post = Post.new(params)
    post.save
    @posts = Post.all
    erb :index
  end

  patch '/posts/:id' do 
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    post_name = URI::encode(@post.name)
    @post.destroy
    redirect to("/posts?deleted=#{post_name}")
  end
end