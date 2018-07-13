require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get "/posts/new" do
    erb :new
  end

  get 'posts/:id' do
    binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end

  post "/posts" do
    @posts = Post.create(name: params[:name], content: params[:content])
    redirect "/posts"
  end

end
