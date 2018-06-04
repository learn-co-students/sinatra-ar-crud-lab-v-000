
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # read all and delete form
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

              # create form
              get '/posts/new' do
                erb :'posts/new'
              end

              # create
              post '/posts' do
                @post = Post.create(params)
                erb :"posts/show"
              end

              # read
              get '/posts/:id' do
                @post = Post.find(params[:id])
                erb :'posts/show'
              end

              # update form
              get '/posts/:id/edit' do
                # edit form displayd here
                @post = Post.find(params[:id])
                erb :'posts/edit'
              end

              # update
              patch '/posts/:id' do
                @post = Post.find(params[:id])
                @post.name = params[:name]
                @post.content = params[:content]
                @post.save
                erb :'posts/show'
              end
    

  # delete
  delete '/posts/:id/delete' do
    # delete post here
    Post.find(params["id"]).delete
    @posts = Post.all
    erb :'posts/index'
  end

end
