require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

 get '/posts/new' do
   erb :new
 end

 post '/posts' do
  @post = Post.create(params)

  redirect_to '/posts'
 end

 get '/posts' do
   erb :index
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
   post1 = Post.find(params[:id])
   post1.update({name: params[:name], content: params[:content]})
   post1.save
   #post1.name = params[:name]
   #post1.content = params[:content]

   redirect_to '/posts/:id'
 end

 delete '/posts/:id/delete' do
   post1 = Post.find(params[:id])
   post1.destroy
 end
end
