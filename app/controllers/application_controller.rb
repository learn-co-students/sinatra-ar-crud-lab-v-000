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

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    #get info from params to post to index / create a new instance of post class!
    #why is Post class not being used here?
    # erb :index
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    #@posts will get all of the posts
    erb :index
  end

  get '/posts/:id' do
    # This action should use Active Record to grab the post with the id that is in
    # the params and set it equal to @post.
    # binding.pry

    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit

  end

  patch 'posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

end
