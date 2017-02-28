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

  get '/posts' do
    @posts = Post.all
    puts @posts
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
    # puts params[:id]
    # puts Post.find(params[:id])
    Post.update(params[:id], "name" => params[:post][:name], "content" => params[:post][:content])
    # puts Post.find(params[:id])
    redirectString = '/posts/' + params[:id]
    redirect to(redirectString)
  end

  post '/posts' do
    #code to create blog post here
    # puts params[:post]
    # temp_post = Post.new(params[:post])
    # puts temp_post
    # Post.all.each do |post|
    #   puts post.name
    #   puts post.content
    # end
    Post.create(params[:post])
    Post.all.each do |single|
      puts single.name
      puts single.content
    end
    redirect to('/posts')
  end

  delete '/posts/:id/delete' do
    @postName = Post.find(params[:id]).name
    Post.delete(params[:id])
    erb :delete
  end

  # get '/deleted/' do
  #   erb :delete
  # end

end
