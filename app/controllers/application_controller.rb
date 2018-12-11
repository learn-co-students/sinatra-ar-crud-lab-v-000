
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
    binding.pry
    @article = Article.create(params)

    redirect "/articles/#{@article.id}"
=======
    @new_article = Article.create(params)

    redirect "/articles/#{@new_article.id}"
>>>>>>> cf5917ec1093f97279d3805f91a58da081b9627f
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
<<<<<<< HEAD

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end
=======
>>>>>>> cf5917ec1093f97279d3805f91a58da081b9627f


  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:title]
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
