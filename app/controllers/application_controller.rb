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
    post = Post.new.tap do |p|
      p.name = params[:name]
      p.content = params[:content]
    end
    post.save

    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    if @post
      erb :show
    end
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    if @post
      erb :edit
    end
  end

  post '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    post.save
    redirect "/posts/#{post.id}"
  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy if @post
    erb :delete
  end
end