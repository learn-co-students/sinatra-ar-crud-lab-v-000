require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/posts/new' do
    erb :"new"
  end

  post '/posts' do
    #binding.pry
    post = Post.create(name: params[:name], :content=> params[:content])


    @posts = Post.all
    #binding.pry
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all

    erb :"index"
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    #binding.pry
    erb :"show"
  end
   get '/posts/:id/edit' do

      @posts = Post.find_by_id(params[:id])
      #binding.pry
       erb :'edit'
    end

    patch '/posts/:id' do
      @post = Post.find_by(id: params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end


    delete '/posts/:id/delete' do
    @posts = Post.find_by_id(params[:id])
    @posts.delete
    erb :delete
  end




end
