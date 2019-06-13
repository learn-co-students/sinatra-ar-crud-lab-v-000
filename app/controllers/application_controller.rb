
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
    Article.create(params)
    
    erb :index
  end
  
  get '/articles'
    @articles = Articles.all
    
    erb :index
  end
  
  get '/articles/:id'
    @article = Article.find(params[:id])
    
    erb :show
  end    
end
