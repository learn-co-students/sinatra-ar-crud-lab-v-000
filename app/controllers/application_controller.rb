
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #Goes to the /new url and allows user to create a new post
    erb :new
  end

  post '/posts' do
    @post = Post.create(params) #Creates a post object with the params from new and redirects to /posts to display
    redirect to '/posts'
  end

  get '/posts' do # This displays all of the posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #This pulls a specific post based on the id number in the last part of the url
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #this gives the user an edit form for a specific post they want to edit
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #this updates a specific post based on the post id then displays the post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #this deletes a post
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

end
