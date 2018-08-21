
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    # binding.pry
    Post.create(name: params[:name], content: params[:content])
    redirect '/posts' 
  end

  get '/posts' do
    erb :'posts/index'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'posts/edit'
  end
  
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{param[:id]}"
  end
delete '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.delete
  erb :'/posts/delete'
end
end
