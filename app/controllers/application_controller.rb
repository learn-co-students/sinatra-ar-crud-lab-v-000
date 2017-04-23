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
    attributes = {name: params[:post][:name], content: params[:post][:content]}
    Post.create(attributes)
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @id = params[:id]
    erb :show
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    erb :edit
  end

  patch '/posts/:id' do
    @id = params[:id]
    Post.find_by(id: @id).update(name: params[:post][:name], content: params[:post][:content])
    erb :show
  end
end
