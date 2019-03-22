
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end


  get '/articles' do
    @articles = all_of_the_articles.select do |article|
      article.id == params[:id]
    end
  erb :index
  end



  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show

  end

end
