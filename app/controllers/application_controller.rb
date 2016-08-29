require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  # configure do
  #   enable :sessions unless test?
  #   set :session_secret, "secret"
  # end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #this loads index page
    @posts = Post.all
    erb :index
  end


# Create the get '/posts/:id' controller action. This action should use Active Record to grab the
# post with the id that is in the params and set it equal to @post. Then, it should render the
# show.erb view page. That view should use erb to render the @post's title and content.

  get '/posts/:id' do
    id = params[:id].to_i
    @post = Post.find_by id: id
    # binding.pry
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
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @message = "#{@post.name} was deleted"
    Post.delete(params[:id])

    erb :deleted
  end



end