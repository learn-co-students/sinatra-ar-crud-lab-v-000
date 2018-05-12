
require_relative '../../config/environment'
require_relative '../models/post.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.new(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(:id)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(:id)
    erb :edit
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(:id)
    erb :delete
  end

  post '/posts/:id/delete' do

  end

end
