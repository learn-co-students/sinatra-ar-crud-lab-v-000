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
    # binding.pry
    @post = Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    post = Post.new(params)
    post.save

    @posts = Post.all
    binding.pry

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
  end
end
