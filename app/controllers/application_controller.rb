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
    @post = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    erb :posts
  end

  get '/posts/:id' do
    @id = params[:id]
    erb :individual_post
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @id = @post.id
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do #delete action
  @post = Post.find_by_id(params[:id])
  @post.delete
  erb :delete
  end

  delete '/posts/delete-all' do #delete action
  Post.all.each do |post|
    post.delete
  end
  redirect '/posts'
  end
end
