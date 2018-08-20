
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts/new'

  end

  get '/posts' do
    @post = Post.all
    erb :posts
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do

    #{"name"=>"jim", "content"=>"this ", "submit"=>"submit"}
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    post_id = @post.id
    redirect '/posts'
  end



  get '/posts/:id' do

    @post = Post.find_by_id(params[:id])
   erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end


patch '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @post.name = params[:name]
  @post.content = params[:content]
  @post.save
  redirect "/posts/#{@post.id}"
end

delete '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @post.destroy
  redirect '/posts'
end



end
