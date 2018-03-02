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
    @post = Post.create(name: params[:name], content: params[:content])
    "#{@post.name} #{@post.content}"
  end

  get '/posts' do
    erb :index
  end

  delete '/posts/:id/delete' do
    #binding.pry
    post_to_delete = Post.find(params[:id])
    @name = post_to_delete.name
    post_to_delete.destroy


    erb :delete
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end
end
