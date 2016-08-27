require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params) # or  @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do # -- displays all posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do # --find by id
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do # --edits post
    @post = Post.find(params[:id])
    erb :edit
  end

  post '/posts/:id' do # --updates and shows updated post in show page
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  post '/posts/:id/delete' do # --deletes and posts to deleted page
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end

end
