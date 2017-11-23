require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    @post = Post.create(params)
    erb :new
  end

  get 'posts' do
    @posts = Post.all
  end
end
