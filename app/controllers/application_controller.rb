
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
    article = Article.create(title: params[:title], content: params[:content])
    article.save
    @articles = Article.all

    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    if @article = Article.find_by_id(params[:id])
      erb :show
    else
      erb "No article with id: #{params[:id]} found"
    end
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    if @article = Article.find_by_id(params[:id])
       @article.title = params[:title]
       @article.content = params[:content]
       @article.save
      erb :show
    else
      erb "No article with id: #{params[:id]} found"
    end
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.destroy

    redirect to "/articles"
  end

end
