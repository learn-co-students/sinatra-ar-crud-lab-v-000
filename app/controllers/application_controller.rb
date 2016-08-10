require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do #(creates)
    p params
    p params[:post]
    post = Post.create(params[:post])
    redirect("/posts/#{post.id}")
  end


  get '/posts' do #(index page)
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #-------- update------->
 
 get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

 post '/posts/:id' do
   @post = Post.find(params[:id]) 
   @post.name = params[:name]
   @post.content = params[:content]
   @post.save
   erb :show
 end







end