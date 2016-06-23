require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do # loads new form
    erb :new
  end

  post '/posts' do # creates a post
    attributes = {
      name: params[:name],
      content: params[:content]
    }
    Post.create(attributes)

    redirect to '/posts'
  end

  get '/posts' do # loads index page
     @posts = Post.all
     erb :index
  end

  get '/posts/:id' do # loads show page
    @post = Post.find_by_id(params[:id]) # find_by_id is a dynamic finder (see 15 of http://guides.rubyonrails.org/active_record_querying.html)
    erb :show
  end

  get '/posts/:id/edit' do # loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do # updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do # deletes a post
    @post = Post.find_by_id(params[:id])
    @post.destroy
    erb :deleted
  end
end