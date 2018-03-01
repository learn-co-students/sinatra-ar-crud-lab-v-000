require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)

    redirect to('/posts')
  end

  gets '/posts' do
    @posts = Post.all

    erb :index
  end

  gets '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end
end
