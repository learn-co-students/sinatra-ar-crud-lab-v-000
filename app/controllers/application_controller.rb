require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    get '/' do #load form
      erb :new
    end

#show individual post
   post '/posts' do
      @post = Post.create(params)
      redirect to '/posts'
    end

#index # lists all the posts
# missing a browser way to get to the next:
   get '/posts' do
     @posts = Post.all
     erb :index
   end

   get '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      erb :show
   end
  #update, two parts : load the form so user can fill it out and 2/post that data to the db
    get '/posts/:id/edit' do # load the edit form
      @post = Post.find_by_id(params[:id])
      erb :edit
    end
# then update the blog post
    patch '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end


# delete

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to 'posts'
    erb :deleted # confirms the deletion
  end
end
