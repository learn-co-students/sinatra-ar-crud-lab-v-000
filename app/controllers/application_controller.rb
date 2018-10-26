
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
    #binding.pry
  end

  post '/posts' do
    post = Post.new(params[:post])
    #binding.pry
    post.save
    redirect'/posts'

  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end



end
