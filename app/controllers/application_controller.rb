require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    Article.create(params)
    redirect to "/articles"
  end
  
  patch '/articles/:id' do  #updates a post
    @article = Article.find_by_id(params[:id])
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
    erb :show
  end

  delete '/articles/:id/delete' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end
end

