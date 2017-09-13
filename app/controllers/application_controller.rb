
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


 get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
 end

 get '/posts/:id/edit' do
  @id = session[:id]
  @post = Post.find(params[:id])

   erb :edit
 end

 patch '/posts/:id' do
   @id = params[:id]
   Post.update(@id, :name => params[:name], :content=> params[:content])
   @post = Post.find(params[:id])
   @post.save
   redirect "/posts/#{@id}"

 end

 delete '/posts/:id/delete' do
   @id = params[:id]
   @post = Post.find(params[:id])
   Post.destroy(@id)
   erb :delete
 end


end
