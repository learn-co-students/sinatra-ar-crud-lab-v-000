require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  get '/posts/new' do
    erb :new
  end
  post '/posts' do
    p=Post.new(name: params[:name], content: params[:content])
    p.save

    erb :index
  end
  get '/posts' do
    @all_posts=Post.all
    erb :index
  end

  get '/posts/:id' do
    @post=Post.find(params[:id])
    erb :show
  end
  get '/posts/:id/edit' do
       @id = params[:id]
       @post = Post.all.find(params[:id])
     	erb :edit
  end

  patch '/posts/:id' do
       @post = Post.find(params[:id])
       @post.update(name: params[:name], content: params[:content])
       redirect_to posts/params[:id]
     end
 
     delete '/posts/:id/delete' do
       @post = Post.find(params[:id])
       @post.destroy
       erb :delete
     end

end
