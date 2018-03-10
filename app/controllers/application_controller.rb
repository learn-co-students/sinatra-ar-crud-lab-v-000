require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to("/posts")
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(params)
    redirect to("/posts")
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
    Post.find(params[:id]).update({:name => params[:name], :content => params[:content]})
    redirect to("/posts/#{params[:id]}")
  end

  delete '/posts/:id/delete' do
    @deleted_post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end

end
