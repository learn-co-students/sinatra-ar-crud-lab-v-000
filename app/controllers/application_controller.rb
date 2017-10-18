require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts/new' do
  @post = Post.create(name:params[:name],content:params[:content])
  @post.save
      redirect to '/posts'
  end

  get '/posts/:id' do
      @post = Post.all.find(params[:id])
      erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.all.find(params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do
      post = Post.find(params[:id])
      post.update({name:params[:name], content:params[:content] })
      redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    post.destroy
    "#{post.name} was deleted"
  end



end
