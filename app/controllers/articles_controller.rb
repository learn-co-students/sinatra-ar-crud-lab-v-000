class ArticlesController < ApplicationController

    get '/articles' do  #<!-- Loads all articles into an instance variable, render to corresponding invdex view.  -->
            @articles = Article.all
            erb :"articles/index"
    end

    get '/articles/new' do
        erb :"articles/new"
    end

    post '/articles' do
        @article = Article.new
        @article.title = params[:title]
        @article.content = params[:content]
        @article.save

        redirect "/articles/#{@article.id}"
    end

    get '/articles/:id' do
        @article = Article.find(params[:id])
        erb :"articles/show"
    end

    get '/articles/:id/edit' do
        @article = Article.find(params[:id])
         erb :"articles/edit"
    end

    patch '/articles/:id' do
        @article = Article.find(params[:id])
        @article.title = params[:title]
        @article.content = params[:content]
        @article.save

        redirect "/articles/#{@article.id}"
    end

    delete '/articles/:id' do
        @article = Article.find(params[:id])
        @article.destroy

        redirect '/articles'
    end

end
