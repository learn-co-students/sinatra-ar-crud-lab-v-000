require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
 get '/posts/new' do
  erb :new
 end

 post '/posts' do
   @post = Post.create(params)
   erb :posts
 end

#Read

#all post
 get '/posts' do
    @posts = Post.all
    erb :index
  end

#individual post
  get '/posts/:id' do
     @post = Post.find(params[:id])
     erb :show
   end

#Update
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
   erb :edit
end

patch '/posts/:id' do
 @post = Post.find(params[:id])
 @post.update({:name => params[:name], :content => params[:content]})
 erb :post
end

delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    deleted = @post.delete
     "#{deleted} was deleted"
     erb :delete
 end

  get '/' do

  end
end
