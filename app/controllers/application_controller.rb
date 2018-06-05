
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
    new_post = Post.new
    new_post[:name] = params[:title]
    new_post[:content] = params[:content]
    new_post.save
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do

    erb :edit
  end

  delete '/posts/:id/delete' do
    @delete_post = Post.find(params[:id])

    erb :delete
  end

end
