require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  #note always us binding.pry.... makes the project so much easier.
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts' do #take in all the input
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    new_post = Post.create(params)
    new_post.save
    redirect to '/posts'
  end

  get '/posts/:id' do
    # use params to get id of the post to 'show'
    @post = Post.find(params[:id])
    erb :show #then create the show.erb in view
  end


  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  # updating is for updating information
  patch '/posts/:id' do
    # use params to get id of the post to 'edit'
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    # update / patch the @post wiht the data from params

    erb :show
  end

  post '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    
    erb :deleted
  end

end
