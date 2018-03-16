
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
    Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id].to_i)
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find_by(id: params[:id].to_i)
    post.name = params[:name]
    post.content = params[:content]
    post.save
    redirect "/posts/#{post.id}"
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id].to_i)
    redirect '/posts'
  end

  get '/' do
    redirect '/posts'
  end
end
