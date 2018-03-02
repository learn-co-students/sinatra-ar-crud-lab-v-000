require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  # CONFIGURATION
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  # Displays the index page
  get '/' do 
    erb :index
  end


  # CREATE
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.new(params).save
    erb :posts
  end


  # READ
  get '/posts' do
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


  # UPDATE
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    name, content = params[:name], params[:content]
    @post = Post.find(params[:id])
    @post.name = name
    @post.content = content
    @post.save
    erb :show
  end


  # DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id]).delete
    erb :delete
  end

end