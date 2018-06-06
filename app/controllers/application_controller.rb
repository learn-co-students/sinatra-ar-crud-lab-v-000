
require_relative '../../config/environment'

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
    new_post = Post.new
    new_post[:name] = params[:name]
    new_post[:content] = params[:content]
    new_post.save
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id])

    erb :delete
  end

end
