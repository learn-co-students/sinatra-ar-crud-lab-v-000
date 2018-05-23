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
    Post.create(params[:name],params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post_id = @posts.select {|post| post.id == params[:id]}

    erb :show
  end
end
