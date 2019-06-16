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
    article = Article.create(:title => params[:title], :content => params[:content])
    article.save
    redirect '/articles'
  end
  
  get '/articles' do
    @rticles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    
    erb :show
  end
  
  get '/articles/:id/edit' do
    erb :edit
  end
  
  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update(:title => params[:title], :content => params[:content])
  end
  
end