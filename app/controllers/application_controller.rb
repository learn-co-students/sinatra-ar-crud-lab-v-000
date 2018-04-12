
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    puts 'get posts new method'
    erb :new
  end

  post '/posts' do
    puts 'post posts method'
    Post.create(params)
    erb :index
  end

  get '/posts' do
    puts 'get posts method'
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    puts 'get posts id method'
    @post = Post.find(params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    puts 'get posts id edit method'
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find_by_id(params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do 
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

end
