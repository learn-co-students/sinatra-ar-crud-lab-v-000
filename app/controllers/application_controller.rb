require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #CREATE

  get '/posts/new' do
    erb :new 
  end

  post '/posts' do
    #raise params.inspect
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


end