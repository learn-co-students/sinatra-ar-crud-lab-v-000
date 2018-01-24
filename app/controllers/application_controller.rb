require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
  get '/posts/new' do 
    erb :new
  end
 
  post '/posts' do 
    @post = Post.create(params)
    redirect to '/posts'
  end

  # Read
  # Instance variable will access all the posts in view
  get '/posts' do 
    @posts = Post.all
    erb :index
  end

  # Read
  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end

  # Update
  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    erb :edit
  end

  # When I use patch, it doesn't work
  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
    # erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])

    @post.destroy

    erb :deleted
  end

end