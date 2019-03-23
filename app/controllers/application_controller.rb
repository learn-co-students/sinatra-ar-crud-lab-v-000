
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #redirects plain URL to show all articles
  get '/' do
    redirect to '/articles'
  end

  #view all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #page for user to add new data
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #saves user data, and shows new published post
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #show specific article based on article id
  get 'articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

end
