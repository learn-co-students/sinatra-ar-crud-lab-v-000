require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])

    erb :edit
  end

  post '/posts' do
    @post = Post.create
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    @posts = Post.all

    erb :index
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    values = {}
    values[:name] = params[:name] if !params[:name].empty?
    values[:content] = params[:content] if !params[:content].empty?
    @post.update(values)

    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.destroy

    erb :delete
  end
end
