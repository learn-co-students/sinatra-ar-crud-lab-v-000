require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

 #create/read
  get '/posts/new' do #(creates a blank form)
    erb :new
  end

  post '/posts' do #(creates an new post)
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all 
    erb :index
  end

  get '/posts/:id' do #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

#update
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

#delete
  delete '/posts/:id/delete' do
   @post = Post.find_by_id(params[:id]) 
   @post.delete
   erb :delete
 end




end#class
