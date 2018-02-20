require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do    #loads new form
  end
    erb :new
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    erb :index
  end

  get '/posts/:id/edit' do #loads edit form
    @post_edit = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do  #updates a post
    @post_edit = Post.find(params[:id])
    @post_edit.name = params[:name]
    @post_edit.content = params[:content]
    @post_edit.save
    erb :show
  end


  delete '/posts/:id/delete' do #deletes a post
    @post_delete = Post.find(params[:id])
    @post_delete.destroy
    erb :deleted
  end
end
