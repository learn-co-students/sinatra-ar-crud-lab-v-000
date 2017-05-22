require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    redirect to '/posts'
  end



  get '/posts'  do
   #grab all the posts and store them in an instance variable @posts
   @posts = Post.all
   erb :index
  end

  get '/posts/:id/edit' do
    #renders edit.rb should update a specific blog post,and post to using patch '/posts/:id
    @update_post = Post.find(params[:id])
    erb :edit
  end

  get '/posts/:id' do
    #grab the post id, and set it equal to the post
      @post = Post.find(params[:id])
      erb :show
  end

  patch '/posts/:id' do
      post = Post.find(params[:id])
      post.name = params[:name]
      post.content = params[:content]
      post.save
      redirect "/posts/#{params[:id]}"
  end


  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end

end
