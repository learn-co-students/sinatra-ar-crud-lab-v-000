
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.create(params)
  
    redirect to "/articles/#{ @article.id }"
  end


  get '/articles/new' do
    @article = Article.new
    erb :new
  end


  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end



# <<<<<<< HEAD
# # end
# =======

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
    redirect to '/posts'
  end


end
# >>>>>>> 9c6464d9607186bb92210f4fcc4f928725d5ad16
