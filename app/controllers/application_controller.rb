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

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @edit_post = Post.find(params[:id])
    erb :edit
  end

  post '/posts' do
    post = Post.create(params)

    redirect to "/posts"
  end

  post '/posts/:id' do
    @post = Post.find(params[:id])
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    # binding.pry
    post.update(name: params[:name], content: params[:content])
    post.save

    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    @delete_post = Post.find(params[:id])
    @delete_post.delete

    erb :delete
  end
end
