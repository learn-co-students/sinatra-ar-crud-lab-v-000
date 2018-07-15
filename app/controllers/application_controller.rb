require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views/posts'
end

  get '/' do

  end

  get '/posts/new' do
    erb :'new'
  end

  post '/posts' do
    Post.create(params)
    rediret '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit'  do  #load edit form
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
  Post.update(
    params[:id].to_i,
    name: params[:name],
    content: params[:content]
  )

  redirect "/posts/#{params[:id]}"
end


 delete '/posts/:id/delete' do #delete action
  @post = Post.find_by_id(params[:id])
  @post.destroy
  erb :delete
end

end
