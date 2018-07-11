
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
    # http://guides.rubyonrails.org/active_record_basics.html#create
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts' do
    # http://guides.rubyonrails.org/active_record_basics.html#read
    @posts = Post.all

    erb :index
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

    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    # http://guides.rubyonrails.org/active_record_basics.html#delete
    @post.destroy
    @posts = Post.all
    erb :index
  end
end
