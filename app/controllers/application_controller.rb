#####Create Action
#creates a new blog post
#redirects to '/posts'
#####Read Action
#####index action
#responds with a 200 status code
#displays all the blog posts
#show action
#show page responds with a 200 status code
#show page displays the post's name
#show page displays the post's content
#####update action
#responds with a 200 status code
#displays the existing object in the edit form
#saves edits to a blog post
#redirects to '/posts/:id'
#submits the form via a patch request
#####delete action
#responds with a 200 status code
#deletes a blog post from the database
#displays a view telling us which post was deleted
#submits the form via a delete request

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
    @post = Post.create(params)
    erb :show
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
    @post = Post.find(params[:id])
    Post.update(@post.id, name: params[:name], content: params[:content])
    redirect to("/posts/#{@post.id}")
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end

end
