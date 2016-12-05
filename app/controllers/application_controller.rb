require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ['/','/posts'].each do |route|
    get route do
      @posts = Post.all 
      erb :index
    end
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    redirect '/posts'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name:params[:name],content:params[:content])
    @post.save
    erb :show
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @message_name = @post.name
    @post.destroy
    erb :deleted
  end

end
