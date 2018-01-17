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
  post_info = {"name" => params[:name], "content" => params[:content]}
  @post = Post.create(post_info)
  @post.save
  erb :index
  end

  get '/posts' do

    erb :index
  end

  get '/posts/:id' do
  @post = params[:id]
  erb :show
  end

  get '/posts/:id/edit' do
    @post = params[:id]
    erb :edit
  end


  patch '/posts/:id' do
    change = Post.all.find(params[:id])
    change.name = params[:name]
    change.content = params[:content]
    change.save
    erb :show
  end

  delete '/posts/:id/delete' do
    post = Post.all.find(params[:id])
    @post_name = post.name
    post.destroy
    erb :delete
  end

end
