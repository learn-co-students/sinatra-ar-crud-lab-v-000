require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hullobot"
  end

  get '/' do
     @posts = Post.all

   end

   get '/posts/new' do
     erb :new
   end

   get '/posts' do
     @posts = Post.all
     erb :index
   end

   post '/posts' do
     Post.create(name: params[:name], content: params[:content])
     redirect to('/posts')
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
     @post = Post.update(params[:id], name: params[:name], content: params[:content])
     erb :show
   end

   delete '/posts/:id/delete' do
     session['message'] = "#{Post.find(params[:id]).name} was deleted"
     Post.delete(params[:id])
     redirect to('/posts')
   end

end