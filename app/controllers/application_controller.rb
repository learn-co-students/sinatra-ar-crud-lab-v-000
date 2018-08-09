
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/posts/new' do
    erb:'new'
    #binding.pry
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb:'show'
  end

  post '/posts/new' do
    Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    #binding.pry
    erb:'index'

  end



  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb:'edit'
    #binding.pry
  end

  patch '/posts/:id' do

    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    @post.save
    erb:'show'
    #binding.pry
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])
    erb:'show'
  end

  delete '/posts/:id/delete' do
    #binding.pry
    @post = Post.find_by(id: params[:id])
    @post.destroy
    erb:'delete'
  end

end
