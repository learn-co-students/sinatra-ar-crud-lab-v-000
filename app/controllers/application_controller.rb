require_relative '../../config/environment'
require_relative '../models/Post.rb'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end


  get '/posts/new' do #renders the form
    erb :new
  end

  post '/posts' do #recieves the post and creates a new instance
    Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/show' do #shows one post
    erb :show
  end

  get '/index' do #shows all posts
    erb :index
  end

  get '/posts' do #shows all posts
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do #shows one post
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do #renders edit post form
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #edits post
    @post = Post.find(params[:id])
    @post.update(name: params[:name],content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    post.destroy
    redirect '/posts'
  end



end