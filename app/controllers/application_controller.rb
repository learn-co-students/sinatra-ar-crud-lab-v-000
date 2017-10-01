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
    @post = Post.new(:name => params[:name], :content => params[:content])
    @post.save

    redirect to '/posts'
  end

  get '/posts' do
    @all_posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.find(@id)
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])
    post.save

    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    @name = post.name

    post.destroy

    erb :delete
  end

  get '/' do

  end
end
