require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

    erb :homepage
  end

  get '/posts/new' do

    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get 'posts/:id' do
    @post = Post.find_by(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    # @id = params[:id].to_i
    erb :edit
  end

  post "/posts" do

    erb :index
  end


  patch '/posts/:id' do

    erb :edit
  end

  delete '/posts/:id/delete' do

    erb :delete
  end
end
