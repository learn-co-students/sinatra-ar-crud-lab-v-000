
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# load new form
  get '/posts/new' do
    erb :new
  end

# creates a post from form submittion and adds to table
  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

# create @posts variable containing all the osts to pass to view
# loads index page which iterates through @posts to display all the blog posts
  get '/posts' do
    @post = Post.all
    erb :index
  end

# creates @posts variable to pass post matching id to view
# loads show page and displays the post
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

# looks up post by id
# loads edit form with existing post displayed in form
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

# updates a post with content from edit form and displays changed post
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

# deletes post by id and redirect to page showing all posts
# delete/action button is in the show.erb
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    rediret to '/posts'
  end

end
