
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # Create

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)

    redirect to "/articles/#{@article.id}"
  end

  # Read

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  # Update

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect to "/articles/#{@article.id}"
  end

  # Delete

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete

    erb :index
  end

end
