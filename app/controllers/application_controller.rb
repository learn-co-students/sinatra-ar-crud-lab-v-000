require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do # route is a GET request to localhost:9393/posts/new
    erb :new # renders the new.erb file, which contains code for the form to create a blog post
  end

  post '/posts' do
    post = Post.create(params) # using mass assignment. params looks like {name: "some name", content: "some content"}

    redirect to "/posts"
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete

    erb :delete
  end
end
