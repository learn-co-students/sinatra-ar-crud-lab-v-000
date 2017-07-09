require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do #root page
    redirect to '/posts'
  end

  get '/posts' do   #loads Index page
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do #loads a new form to create post
    erb :new
  end

  post '/posts' do #get form data from '/posts/new'
    Post.create(params)
    @posts = Post.all
    redirect to '/posts'
  end

  get '/posts/:id' do #loads Show page with individual post details
    @post = Post.find_by_id(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do #loads Edit page with individual post details
    @post = Post.find_by_id(params[:id])

    erb :edit
  end

  patch '/posts/:id' do  #redirect back to Show page
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do  #get form data from '/posts/:id' page
    @post = Post.find_by_id(params[:id])
    @post.destroy

    erb :delete
  end

end
