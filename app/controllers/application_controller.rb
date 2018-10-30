
require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "hello"
  end

  get '/posts/new' do
    erb :new
  end
#<<<<<<< HEAD
#<<<<<<< HEAD
#=======
#<<<<<<< HEAD
#>>>>>>> 61b3befb5416db1451f4e4031207befd2f0f3dcf

  post '/posts' do
  #  binding.pry
    #@post = Post.create(params)
    @post=Post.create(name: params[:name], content: params[:content])
    redirect "/posts"
    #erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
     @post = Post.find_by_id(params[:id])
     erb :edit
   end

   patch '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end

delete '/posts/:id/delete' do
  @post = Post.find_by_id(params[:id])
   @post.destroy
   erb :deleted
end







end
