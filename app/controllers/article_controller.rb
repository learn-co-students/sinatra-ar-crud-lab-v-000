class ArticleController < ApplicationController

    get "/articles" do
        @articles = Article.all
        erb :"article/all"
    end

    get "/articles/new" do
        erb :"article/new"
    end

    post "/articles" do
        article = Article.new(params)
        article.valid? ? article.save : redirect("/youstupid")
        @article = Article.find(article.id)

        redirect "/articles/#{@article.id}"
    end
    
    get "/articles/:id" do
        begin
            @article = Article.find(params[:id])
        rescue => exception
            redirect "/youstupid"
        end
        erb :"article/show"
    end

    get "/articles/:id/edit" do
        begin
            @article = Article.find(params[:id])
        rescue => exception
            redirect "/youstupid"
        end
        erb :"article/edit"
    end

    patch "/articles/:id" do
        article = Article.find(params[:id])
        article.title = params[:title]
        article.content = params[:content]
        article.valid? ? article.save : redirect("/youstupid")
        redirect "/articles/#{article.id}"
    end

    delete "/articles/:id/delete" do
        Article.find(params[:id]).destroy
        redirect "/articles"
    end
end