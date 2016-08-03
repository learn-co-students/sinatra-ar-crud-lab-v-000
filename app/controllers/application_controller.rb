require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # New
  get '/posts/new' do
    erb :new
  end

  # Index
  post '/posts' do
    Post.new(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


end
