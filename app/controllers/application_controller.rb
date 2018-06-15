require_relative '../../config/environment'

require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :"../views/new"
  end

  post '/posts' do
    name = params[:name]
    content = params[:content]
    @post = Post.create(:name => name, :content => content)

    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :"../views/index"
  end

  get '/posts/:id' do
    @post = Post.find_by(params[:id])

    erb :"../views/show"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :"../views/edit"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])

    redirect to("/posts/#{params[:id]}")
  end

  delete '/posts/:id' do
    @post_for_deletion = Post.find(params[:id])
    @post_for_deletion.delete

    redirect to('/')
  end

end
