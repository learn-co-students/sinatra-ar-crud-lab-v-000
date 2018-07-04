
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @posts=Post.all
    erb :index
  end

  get '/posts/new' do #create a new blog post
    erb :new
  end

  post '/posts' do #send form redirect /posts
    Post.create(params)
    @posts=Post.all
    redirect '/posts'
  end

  get '/posts' do #show all posts
   @posts=Post.all
   erb :index
 end

   get '/posts/:id' do #find post by number
     @post = Post.find_by_id(params[:id])
    erb :show
   end

   get '/posts/:id/edit' do #edit form
     @post = Post.find_by_id(params[:id])
     erb :edit
   end

    patch '/posts/:id' do #submit & save the edit
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      redirect to "/posts/#{@post.id}"
    end

    delete '/posts/:id/delete' do #find post and delete it
      @post = Post.find_by_id(params[:id])
      @post.delete
      erb :delete
    end
end
