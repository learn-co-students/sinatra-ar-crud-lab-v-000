
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
    # "This works!"
    erb :new
  end
  
  get '/articles/:id' do 
    binding.pry
    erb :show
  end
  
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
    # erb :show
  end
  
end
