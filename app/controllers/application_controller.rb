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
    erb :"posts/new"
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts' do
    @posts = Post.all
    erb :"posts/index"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"posts/show"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :"posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :"posts/:id"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy

    puts "#{@post.name} was deleted"
    erb :"posts/show" # this is messed up -- see open issue 277
  end

end
