require_relative '../../config/environment'
#====================================================== 
class ApplicationController < Sinatra::Base
#========================config======================== 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#========================routes======================== 
  # CREATE
#-------------------------------------------------new-# 
  get "/posts/new" do 
  	erb :'new'
  end
#-----------------------------------------------posts-# 
  post "/posts" do 
    @post = Post.create(params)
    redirect to '/posts' #always use redirect on a post request 
  end 
#====================================================== 
  # READ
#-----------------------------------------------index-#   
  get "/posts" do 
    @posts = Post.all
  	erb :'index'
  end
#------------------------------------------------show-#  
  get "/posts/:id" do 
    @post = Post.find(params[:id])
  	erb :'show'
  end
#====================================================== 
  # UPDATE
#------------------------------------------------edit-#   
  get "/posts/:id/edit" do 
    @post = Post.find_by_id(params[:id])
  	erb :'edit'
  end
#------------------------------------------------show-#  
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'show'
  end
#====================================================== 
  # DELETE
#---------------------------------------------deleted-#   
  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :'deleted'
  end
#====================================================== 
end