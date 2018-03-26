require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
    erb :'new'
  end

  post '/posts' do
    post = Post.new
    post.name = params[:name]
    post.content = params[:content]
    post.save
    @all = Post.all
  end

  get '/posts/:id' do
  end



end
