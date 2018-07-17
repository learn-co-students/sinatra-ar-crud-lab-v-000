
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
      @new_post = Post.new(name: params[:name], content: params[:content])
      @new_post.save
      redirect to '/posts'
    end

  get '/posts' do
    @post = Post.all
    erb :posts
  end



end
