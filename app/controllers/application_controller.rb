require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/posts/new" do # makes new form
    erb :new
  end

  post "/posts" do # creates a post
    @post = Post.create(name: params[:name], content: params[:content])
    redirect "/posts"
  end

  get "/posts" do # loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do # shows all posts
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  post '/posts/:id/edit' do # shows edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name(params[:name])
    @post.content(params[:content])
    @post.save
  end

  post '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end
end
