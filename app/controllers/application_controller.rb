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
    @posts = Post.new(name: params[:name], content: params[:content])
    @post.save 
    erb :new
  end
end
