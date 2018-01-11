require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :root
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    @post = Post.new
    erb :form
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :form
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    Post.create(params[:post])
    redirect '/posts'
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(params[:post])
    redirect "/posts/#{post.id}"
  end

end


