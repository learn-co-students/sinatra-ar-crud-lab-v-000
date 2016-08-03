require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params['id'])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params['id'])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params['id'])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete

    erb :deleted
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :show
  end

  get '/posts' do
    @post = Post.all
    erb :index
  end
end
