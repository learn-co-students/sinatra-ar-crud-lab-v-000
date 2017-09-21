require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # create
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # binding.pry
    # manual way
    # @post = Post.new(params)
    # params => {"name"=>"New Post", "content"=>"Here is the content"}
    # @post = => #<Post:0x007fbb0cdc29f8 id: nil, name: "New Post",
      # content: "Here is the content">

    # AFTER SAVE: @post = => #<Post:0x007fbb0cdc29f8 id: 1, name: "New Post",
      # content: "Here is the content">
    # @post.save

    @post = Post.create(params)

    # send user to main posts page that contains all the posts
    redirect to '/posts'
  end

  # read
  get '/posts' do
    @posts = Post.all
    # binding.pry
    erb :index
  end

  #  grab the post with the id that is in the params and set it equal to @post
  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    # redirect "/posts/#{@post.id}"
    # or    
    erb :show
  end
end
