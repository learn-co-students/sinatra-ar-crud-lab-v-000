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

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  post '/posts' do
    @post = Post.create(params)

    erb :index
  end

  get '/posts/:id' do
    id = params[:id]
    @post = Post.find(id)

    erb :show
  end

  get '/posts/:id/edit' do
    id = params[:id]
    @post = Post.find(id)

    erb :edit
  end

  patch '/posts/:id' do
    id = params[:id]
    hash = { id: params[:id], name: params[:name], content: params[:content] }
    @post = Post.find(id)
    @post.update(hash)

    redirect to("posts/#{id}")
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @title = @post.name
    @post.destroy

    erb :delete
  end
end
