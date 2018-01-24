require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ## Read all posts
  get '/' do 
    erb :index
  end

  ## Form to create a new post
  get '/posts/new' do
    erb :new
  end

  ## Create new post
  post '/posts' do
    # create the post & save to database
    @post = Post.create(params)

    redirect to "/posts"
    # erb :index
  end

  ## SAME AS '/' ?
  get '/posts' do
    # binding.pry
    @posts = Post.all
    erb :index
  end

  ## Read a specific post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  ## Form to edit a post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  ##Save the updated post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    Post.update(@post.id, :name => params[:name], :content => params[:content])

    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(@post.id)
    erb :delete_message
  end

end