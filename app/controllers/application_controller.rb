require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
  	@posts = Post.all
    erb :index
  end

  get '/posts/new' do
  	erb :new
  end

  get '/posts/:id' do 
  	@post = Post.find(params[:id])
  	erb :show
  end

  get '/posts/:id/edit' do 
  	@post = Post.find(params[:id])
  	erb :edit
  end

  post '/posts' do 
  	Post.create(params)
  	redirect to :'/'
  end

  patch '/posts/:id' do
  	Post.find(params[:id]).update(name: params[:name], content: params[:content])
  	redirect to :"/posts/#{params[:id]}"
  end

  get '/posts/:id/delete' do 
  	@id = params[:id]
  	erb :delete
  end

  delete '/posts/:id/delete' do 
  	Post.delete(params[:id])
  	@id = params[:id]
  	redirect to '/'
  end

end