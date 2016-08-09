require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do 
    erb :posts
  end

  get '/posts/new' do 
    erb :new
  end

  post '/posts/new' do 
    Post.create(:name => params[:name], :content => params[:content])
    redirect to '/posts'
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
    Post.update(params[:id], :name => params[:name], :content => params[:content])
    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id' do 
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :deleted
  end



end