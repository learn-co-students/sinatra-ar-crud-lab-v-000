require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


#  get '/' do 
 #   erb :index
 # end

  get'/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(:name => params[:name], :content => params[:content])
    erb :posts
  end

  get '/posts' do
    @posts = Post.all
    erb :posts

  end

  post '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
end