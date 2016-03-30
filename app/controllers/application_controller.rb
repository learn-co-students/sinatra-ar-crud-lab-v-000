require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    #binding.pry
    redirect '/posts'
  end

  get '/posts/:id' do
    # use Active Record to grab the post with the id that is in the params and set it equal to @post
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update name: params[:name], content: params[:content]
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    #@post = Post.find(params[:id])
    Post.destroy(params[:id])
    redirect '/posts'
  end


end
