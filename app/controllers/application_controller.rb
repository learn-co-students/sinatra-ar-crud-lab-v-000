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
    @post = Post.new(params)
    @post.save
    erb :show

  end

  get '/posts' do
    @posts = Post.all
    erb :index

  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show

  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit

  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{ params[:id] }"

  end

  delete '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post2 = Post.destroy(params[:id])
    #binding.pry
    @post.name = "#{@post2.name} was deleted"
    @post.content = ""

    erb :show

  end



end
