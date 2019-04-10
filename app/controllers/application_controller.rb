
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

#create

    #index
    get '/articles' do
        @articles= Article.all
        erb :index
    end
    #new
   get '/articles/new' do
     erb :new
   end
   #new post
   post '/articles' do
    @new_article = Article.create(title: params[:title], content: params[:content])


    # redirect to '/articles'
     erb :index
   end


   get '/articles/:id' do
     binding.pry
     @article = Article.find(params[:id])
     erb :show
   end



end
