require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index  
  end

  # create
  get '/posts/new' do 
    erb :new
  end

  post '/posts' do 
    @post = Post.new(name: params[:name], content: params[:content])
    @post.save
   # binding.pry
  	erb :index
  end

  # read
  get '/posts' do 
  	@posts = Post.all
  #  binding.pry
  	erb :index
  end

  get '/posts/:id' do 
  	@post = Post.find(params[:id]) 
  	erb :show 
  end

  # update
  get '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.all.find(params[:id])
  	erb :edit
  end

  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect_to posts/params[:id]
  end

  #delete
  delete '/posts/:id/delete' do 
    @post = Post.find(params[:id]) 
    @post.destroy
    erb :delete
  end

end