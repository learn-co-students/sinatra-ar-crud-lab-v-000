require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts' do
    # raise params.inspect
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    # raise params.inspect
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    # raise params.inspect
    @post = Post.find(params['id'])
    erb :show
  end

  patch '/posts/:id' do
    # raise params.inspect
    Post.find(params['id']).update({'name'=>params['name'], 'content'=>params['content']})
    @post = Post.find(params['id'])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params['id'])
    erb :edit
  end

  delete '/posts/:id/delete' do
    @name = Post.find(params['id']).name
    Post.find(params['id']).destroy
    erb :delete
  end

end
