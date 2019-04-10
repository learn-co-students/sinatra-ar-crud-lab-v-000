
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


     redirect to '/articles/'+ @new_article.id.to_s

   end

#Read

   get '/articles/:id' do

     @article = Article.find(params[:id])
     erb :show
   end

#Update
        get '/articles/:id/edit' do
          @article= Article.find(params[:id])
          erb :edit
        end

    patch '/articles/:id' do
        #  binding.pry
         @article_mod= Article.find(params[:id])
         @article_mod.update(params[:article])

       redirect "/articles/#{@article_mod.id}"  #esta forma se llama interpolation
    end

#Delete
     delete '/articles/:id' do
           @article_del= Article.find(params[:id])
        
           @article_del.destroy
           erb :delete
     end

end
