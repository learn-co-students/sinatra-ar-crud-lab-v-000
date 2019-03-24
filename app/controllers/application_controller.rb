
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get'/articles/new' do
    @article = Article.new
    erb :new
  end


  post '/articles' do
    @article = Article.create(params)
    redirect to '/articles/#{@article.id}'
  end


  get '/articles' do
    @articles = Article.all
  erb :index
  end



  # get '/articles/:id' do
  #   @article = Article.find(params[:id])
  #   erb :show
  # end
  #
  #
  #
  # patch '/articles/:id/edit' do
  #   @article = Article.find(params[:id])
  #   erb :edit
  # end
  #

  # update '/articles' do
  #   @article = Article.find(params[:id])
  #   @article.update(params[:id])
  # end

  # delete '/articles/:id' do
  #   erb :show
  # end
  #
  #  binding.pry

end
