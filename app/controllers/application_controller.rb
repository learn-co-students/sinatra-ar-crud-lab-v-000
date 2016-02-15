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

  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show 
  end 


  get '/posts' do
      
     @post = Post.all 

     erb :index 
  end 

  

  get '/posts/:id/edit' do 
     @post = Post.find(params[:id])
     @id = params[:id]
     erb :edit 
  end 


  patch '/posts/:id' do 
    
    @post = Post.find(params[:id]) 
    @post.update_all 
    @post.save
     
    erb :show 

  end 


  post '/posts' do 
    
    @new = Post.create(params)
    @post = Post.all 
    

    erb :index 
   
  end


  get '/show' do 

   erb :show 
  end 

  get '/index' do 

    erb :index 
  end 


end














