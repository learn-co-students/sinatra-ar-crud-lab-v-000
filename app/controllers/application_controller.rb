require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # index

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # new

  get '/posts/new' do
    erb :new
  end

  # edit

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  # show

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  # create

  post '/posts' do
    @post = Post.new(params)

    if @post.save
      redirect "/posts"
    else
      redirect "/posts/new"
    end
  end

  # update

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    if @post.update(name: params[:name], content: params[:content])
      redirect "/posts/#{@post.id}"
    else
      redirect "/posts/#{@post.id}/edit"
    end
  end

  # destroy

  delete '/posts/:id' do
    post = Post.find(params[:id])
    @post_name = post.name
    post.destroy
    erb :delete
  end
end
