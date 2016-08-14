require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #blank post creation form
    erb :new
  end
  post "/posts" do #activates on new post submission
    @post = Post.create(params)
    redirect to "/posts"
  end
  get "/posts" do #lists posts
    @posts = Post.all
    erb :index
  end
  get "/posts/:id" do #loads single post
    @post = Post.find(params[:id])
    erb :show
  end
  get "/posts/:id/edit" do #loads post edit page
    @post = Post.find(params[:id])
    erb :edit
  end
  patch "/posts/:id" do #updates post, goes to post page
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end
  delete "/posts/:id/delete" do #deletes post, shows deletion page
    @post = Post.find(params[:id])
    @post.destroy
    erb :deleted
  end
end