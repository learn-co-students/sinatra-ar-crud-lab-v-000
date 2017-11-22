require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

    get '/' do

    end
#create blog post and save to database
    get '/posts/new' do

      erb :new
    end
#show
   get '/posts/:id'
    #use AR to grab post with the id in the params, set equal to @post
    @post =

    erb :show # shows an individual post
    end

#index
   get '/posts'
   #use AR to grab all the posts and store them in instance variable,
   #@posts
   @posts =
   erb :index # lists all the posts

#update = edit controller action
  get /'posts/:id/edit'

  erb :edit
end
