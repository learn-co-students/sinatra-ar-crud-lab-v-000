require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  post '/articles' do
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end
  
  patch '/articles/:id' do
    updated_article = Article.find(params[:id]).tap do |article|
        new_params = params.keep_if {|key, value| key == "title" || key == "content"}
        # I could have also done params.reject {|key, value| key == "_method"}, but the other way is easier to understand. 
        # Also, I'd rather not change the "id" accidentally.
        # Not sure if this is the easiest code to extend (without bugs), though...
        
        article.update(new_params)
    end # This returns the new, updated article
    
    redirect to "/articles/#{updated_article.id}"
  end
  
  delete '/articles/:id' do
    # "The article was successfully deleted!"
    
    Article.find(params[:id]).destroy
    # The #delete CRUD method works as well
    
    redirect to "/articles"
  end
  
end
