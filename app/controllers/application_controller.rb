require_relative '../../config/environment'

#to start this lab, we need to start by crerating the db tables
#  in terminal,  rb db:create_migration NAME=create_posts
#within the db file, right a change method that uses active record to setup the posts table with the appropriate columns
#then run in terminal rake db:migrate to setup


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
#in new.erb we inserted a form that posts to '/posts'
  post '/posts' do
#binding.pry
#here we create an instance variable using ActiveRecord Create from CRUD
      @post = Post.create(name: params[:name], content: params[:content])
#here we redirect to '/posts'
      redirect to '/posts'  #this will navigate to our controller below and not to an erb file
  end

  get '/posts' do
    #using ActiveRecord and Read we can apply .all to our Posts table as Post.all
      @posts = Post.all
      erb :index
  end
  #READ  we are able to extract a Post via the primary key id and assign that to a variable
  get '/posts/:id' do
      #the ":id" in the route makes this a dynamic url route that allows the user to input something here to be searched in code below
      @post = Post.find(params[:id])
      erb :show
      #in the show.erb we also provide a delete button that will direct to the route below for delete (last)
  end
  get '/posts/:id/edit' do
   	@post = Post.find(params[:id])
   	erb :edit
   end

   #this sets up the edit patch route
     patch '/posts/:id' do
       	@post = Post.find(params[:id])
       	@post.update(name: params[:name], content: params[:content])
       	redirect to "/posts/#{params[:id]}" #navigates to the above route, not a erb file
     end


  delete '/posts/:id/delete' do
      @post = Post.find(params[:id])
      @post.destroy
      erb :delete
  end
  #as a note, after a post has been deleted, the primary id key does not change for the other table rows that still exist
end
