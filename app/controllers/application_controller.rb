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
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    id = params["id"].to_i
    @post = Post.find_by(id: id)
    binding.pry
    erb :show
  end

  get '/posts/:id/edit' do
    id = params["id"].to_i
    @post = Post.find_by(id: id)
    erb :edit
  end

  patch '/posts/:id' do
    params.delete("_method")
    id = params["id"].to_i
    @post = Post.find_by(id: id)
    @post.update(params)
    redirect "/posts/#{id}"
  end

  delete '/posts/:id/delete' do
    id = params["id"].to_i
    Post.destroy(id)
  end

end
