
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @new_article = Article.create(params)
    # binding.pry
    redirect "/articles/#{@new_article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
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
    redirect to '/posts'
  end


end
