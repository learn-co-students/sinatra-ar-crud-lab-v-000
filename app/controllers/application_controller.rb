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
    Post.create(name: "#{params[:name]}", content: "#{params[:content]}")
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: "#{params[:id]}")
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: "#{params[:id]}")
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: "#{params[:id]}")
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post_name = Post.find_by(id: "#{params[:id]}").name
    Post.find_by(id: "#{params[:id]}").destroy
    erb :delete
  end
end
