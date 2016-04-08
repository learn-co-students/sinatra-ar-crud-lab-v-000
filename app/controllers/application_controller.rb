require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


#CREATE
  get '/posts/new' do  
  	erb :new
  end

  post '/posts' do
  	@post = Post.create(params)
  	erb :index
  end

  #READ
  get '/posts' do
  	#grab all post and store in @posts
    @posts = Post.all
  	erb :index
  end

  get '/posts/:id' do
  	#use ActiveRecord to grab the post with the id that's in params
  	#and set equal to @post
    @post = Post.find(params[:id])
  	erb :show
  end

  #UPDATE
  get '/posts/:id/edit' do
     @post = Post.find(params[:id])
  	erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :edit
  end


  #DELETE
  delete '/posts/:id/delete' do
    @post = Post.destroy(params[:id])
  	erb :show
  end

  get '/posts' do
    erb :show
  end

end