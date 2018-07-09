
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(params)
    redirect '/posts'
  end

  get '/posts/new' do #create a new blogpost
    erb :new
  end


   get '/posts' do #show all posts
     @posts = Post.all
     erb :index
   end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #edit the form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch "/posts/:id" do #submits and saves the updates
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do #deletes the post
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end
end
