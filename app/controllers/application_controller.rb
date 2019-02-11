
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
    @article = Article.create(title: params[:title], content: params[:content])
    #reminder that these attributes the model inherits from the table
    #in db migrate
    redirect to "/articles/#{@article.id}"
    #this redirect goes to an interpolated version of /articles/:id
    #redirecting routes is done like this
    #" " works better than ' '
  end

  get '/articles' do
    @articles = Article.all #inherited from ActiveRecord,
    #the tables magically have all methods
    erb :index
  end

  get '/articles/:id' do
      @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    

    erb :edit
  end
end
