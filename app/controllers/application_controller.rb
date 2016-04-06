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
    @new_post = Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect '/posts/' + @post.id.to_s
  end

  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
  erb :edit
  end


  delete '/posts/:id/delete' do 
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end


end