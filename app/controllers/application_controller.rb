require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    binding.pry
    @new_post = Post.create(params[:name], params[:content])
    @new_post_name = @newpost.name
    @new_post_content = @new_post.content

    erb :index
  end
end
