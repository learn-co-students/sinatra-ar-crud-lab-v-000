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
  get '/' do

  end

  get '/posts/new' do
   #RENDER NEW.EB
    erb :new
  end

  post '/posts' do
    @name = params[:name]
    @content = params[:content]
    Post.create(name: @name, content: @content)
     erb :posts
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

end
