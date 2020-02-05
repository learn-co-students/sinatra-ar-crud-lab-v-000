
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  


  get '/articles/new' do
    erb :new
  end

  post '/posts' do
    Article.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @articles = Article.all
    erb :index
  end

  get '/posts/:id' do
    @articles = Article.find(params["id"])
    erb :show
  end

  get '/posts/:id/edit' do
    @articles = Article.find(params["id"])
    erb :edit
  end

  patch '/posts/:id' do
    id = params["id"]
    new_params = {}
    old_post = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_post.update(new_params)

    redirect "/posts/#{id}"
  end

  delete '/posts/:id/delete' do
    @articles = Article.find(params["id"])
    @articles.destroy
    erb :delete

end
end
