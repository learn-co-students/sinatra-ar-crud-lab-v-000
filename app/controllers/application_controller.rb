
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do # loads new blog post form
    erb :new
    end

    post '/posts' do #creates a blog post
      @post = Post.create(params)
      redirect to '/posts'
    end

    get '/posts' do #loads index page with listing of all blog posts
       @posts = Post.all
       erb :index
     end

      get '/posts/:id' do #loads show page with listing of selected blog post
       @post = Post.find_by_id(params[:id])
       erb :show
     end

    get '/posts/:id/edit' do #loads edit blog post form with prefilled listing of selected blog post
       @post = Post.find_by_id(params[:id])
       erb :edit
     end

    patch '/posts/:id' do #updates a selected blog post
       @post = Post.find_by_id(params[:id])
       @post.name = params[:name]
       @post.content = params[:content]
       @post.save
       erb :show
  	  end

      delete '/posts/:id/delete' do #deletes a selected blog post
       @post = Post.find_by_id(params[:id])
       @post.delete
       redirect to '/posts'
     end
     end
