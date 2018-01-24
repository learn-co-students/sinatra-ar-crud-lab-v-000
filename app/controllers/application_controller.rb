require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do    
  	erb :new
  end

  post '/posts' do    
  	new_post=Post.new(name: params[:name], content: params[:content])
  	new_post.save
  	@all_posts=Post.all
  	erb :index
  end

  get '/posts' do    
  	@all_posts=Post.all
  	erb :index
  end

  get '/posts/:id/edit' do  
  	@post=Post.find(params[:id])
  	erb :edit
  end

  post '/posts/:id/delete' do  
  	post=Post.find(params[:id])
  	post.delete
  	redirect to '/posts'
  end

  get '/posts/:id' do   
  	@all_posts = [Post.find(params[:id])]
  	erb :index
  end

  post '/posts/:id' do   
  	edited_post = Post.find(params[:id])
  	#binding.pry
  	edited_post.name=params[:name]
  	edited_post.content=params[:content]
  	edited_post.save
  	@all_posts = [edited_post]
  	redirect to "/posts/#{params[:id]}"
  end

  

end