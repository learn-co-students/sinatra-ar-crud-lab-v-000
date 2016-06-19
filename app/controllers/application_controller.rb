require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # before do
  #   @post1 = Post.create(:name => post_name, :content => post_content)
  #   @post2 = Post.create(:name => "second post", :content => "i'm a really good blogger")
  # end
  get '/posts/new' do
   #RENDER NEW.EB
    erb :new
  end

  post '/posts' do  #creates a post
   @post = Post.create(params)
   redirect to '/posts'
 end
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end


  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end


    patch '/posts/:id' do  #updates a post
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted

  end

end
