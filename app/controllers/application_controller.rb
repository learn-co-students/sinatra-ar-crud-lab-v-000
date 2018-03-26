require 'pry'
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
    Post.create(name: params[:name], content: params[:content])

    erb :index
  end

  get '/posts' do
    @posts=Post.all
    erb :index
  end

  get '/posts/:id' do
    @post=Post.all.find_by(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    #binding.pry
    @post = Post.all.find_by(params[:id])
    erb :edit
  end

  patch '/posts/:id' do

    @post=Post.all.find_by(params[:id])
    @post.update(name: params[:name], content: params[:content])
    #binding.pry
    redirect to "/posts/#{params[:id]}"
  end





end
