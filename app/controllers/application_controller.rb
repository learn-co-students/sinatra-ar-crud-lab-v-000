require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#CREATE
  get '/posts/new' do #displays form to create a new object
    erb :new
  end

  post '/posts' do #creates a new object from user's input in form
    # @post = Post.create(params)
    @post = Post.create(name: params[:name], content: params[:content])

    redirect to '/posts' #redirects user to where they can see all posts.
  end

#READ
  get '/posts' do #displays ALL posts.
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #displays a particular post
    @post = Post.find(params[:id])
    erb :show #displays post and a delete button
  end

  #UPDATE
  get '/posts/:id/edit' do #displays form for user to update
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #finds the post being updated and updates the info
    @post = Post.find(params[:id])
    # @post.name = params[:name]
    # @post.content = params[:content]
    # @post.save
    @post.update(name: params[:name], content: params[:content])
    erb :show #displays updated content
  end

#DELETE
  delete '/posts/:id/delete' do #If user pushes delete button, this will find and delete that post from database.
    @post = Post.find(params[:id])
    @post.delete

    erb :delete #Confirmation that post has been deleted.
  end

end
