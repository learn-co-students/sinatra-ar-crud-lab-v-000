require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/?' do
    erb :posts
  end

  get '/posts/new/?' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    erb :posts
  end

  get '/posts/?' do
    erb :posts
  end

  get '/posts/:id/?' do
    @post = Post.find(params[:id])
    erb :post
  end

  get '/posts/:id/edit/?' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update({:name => params[:name], :content => params[:content]})
    erb :post
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    deleted_name = @post.name
    @post.delete
    "Post #{deleted_name} was deleted. <a href='/'>BLOGOSPHERE</a> "
  end


end
