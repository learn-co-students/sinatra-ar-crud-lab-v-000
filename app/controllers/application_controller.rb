require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #To direct to a form to make a new post
  get '/posts/new' do
    erb :new
  end

  #To create the actual "Post" instance using params from the form
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

  #To display all the posts
  get '/posts' do
    @posts = Post.all

    erb :index
  end

  #To display a particular post, using the :id as well as the delete button to delete the post
  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  #To display a page to edit a particular post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  #The actual update of a particular instance of "Post" and then to display the updated post
  patch '/posts/:id' do
    @updated_post = Post.find(params[:id])
    @updated_post.update(name: params[:name], content: params[:content])
    redirect '/posts/'+ params[:id]
  end

  #To receive the actual deletion 'post' from the show page, and delete the actual post, as well as show a page confirming the post was deleted
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy

    erb :deleted
    #redirect '/posts'
  end
end
