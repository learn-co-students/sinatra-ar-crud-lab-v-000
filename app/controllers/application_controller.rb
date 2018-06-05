
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #creates new form
    erb :new
  end

  post '/posts' do #filled-in form
    @post = Post.create(params) #{name => "",}
    redirect to '/posts'
  end
  
  get '/posts' do #loads index - shows all posts created
    @posts = Post.all
    erb :index
  end

 get '/posts/:id' do 
    @single_post = Post.find_by_id(params[:id])
    erb :show
 end

 get '/posts/:id/edit' do 
    @single_post = Post.find_by_id(params[:id])
    erb :edit
 end

 patch '/posts/:id' do 
    @single_post = Post.find_by_id(params[:id])
    @single_post.name = params[:name]
    @single_post.content = params[:content]
    @single_post.save
    erb :show
 end

 delete '/posts/:id/delete' do
    @single_post = Post.find_by_id(params[:id])
    @single_post.delete
    erb :deleted
 end

end