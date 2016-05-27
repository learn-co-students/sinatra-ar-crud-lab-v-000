require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/posts/new'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # Post.create(params[:post])
    Post.create({:name => params[:name], :content => params[:content]})
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    #update the record
    new_name = params[:name]
    new_content = params[:content]

    @post = Post.find(params[:id])
    @post.update(name: new_name, content: new_content)
    erb :show
  end

  delete '/posts/:id/delete' do
    # delete the post
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    # redirect to '/posts'
    @posts = Post.all
    erb :index
  end
end
