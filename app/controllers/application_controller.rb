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
  post '/post' do
post= Post.create(title: params[:title], content: params[:content])
erb :index
  end


  get '/show' do
    erb :show
  end

  get '/index' do
  erb :index
  end

 get '/posts' do
   @posts = params[:posts]
  erb :index
  end

get '/posts/:id' do
  @post= Post.find(params[:id])
  erb :show
end

get '/posts/:id/edit' do
  @post= Post.find(params[:id])
erb :edit
end

patch '/posts/:id' do
post = Post.find_by(id: params[:id])
post.update(name: params[:name])
post.update(content: params[:contents])
end

delete '/posts/:id/delete' do
  end

end
