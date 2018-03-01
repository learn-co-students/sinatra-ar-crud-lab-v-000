require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    #what do here?
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)

    redirect to('/posts')
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end

end
