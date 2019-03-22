
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/articles/new' do
    # @article = params[:title][:content]
    erb :new
  end


  post '/articles/new' do
    @article = params[:title][:content]
    erb :new
  end

#
#   get '/articles' do
#     @articles = all_of_the_articles.select do |article|
#       article.id == params[:id]
#     end
#   erb :index
#   end
#
#
#
#
#   get '/articles/:id' do
#     @article = Article.find(params[:id])
#     erb :show
#   end
#
#
#
#   patch '/articles/:id/edit' do
#     @article = Article.find(params[:id])
#     erb :edit
#   end
#
#   delete '/articles/:id' do
#     erb :show
#   end
#
# # binding.pry
#
end
