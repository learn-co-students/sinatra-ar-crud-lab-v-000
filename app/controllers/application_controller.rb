
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
    erb :index
  end
  
  get '/show' do
    erb :show
  end
  
  get '/index' do
    erb :index
  end
  
  get '/posts' do
    # @posts = all posts
    
    # this view should iterate through @posts to display them all
    erb :index
  end
  
  get '/posts/:id' do
    # @post = grab post with ID that matches params
    
    # show display posts title and content
    erb :show
  end
  
  get '/posts/:id/edit' do
=begin
  - should contain a form to update a specific blog post and POSTs to a controller action, patch '/posts/:id'
  - should include <input id="hidden" type="hidden" name="_method" value="patch">
  - add the use Rack::MethodOverride to your config.ru file so that your app will know how to handle patch and delete
=end
    
    erb :edit
  end
  
  delete '/posts/:id/delete' do
=begin
  - add delete button to show page that's actually a form
  - it will send a post requre to this delete controller action
  - after the deletion render the view below which confirms deletion
  - make a form that has no input fields, only a "submit" button with a value of "delete"
  - give your form a method of "post" and an action of "/posts/:id/delete'
  - Make sure to dynamically set the :id of the form action
  - be sure the form includes the hidden input tag to change the request from post to delete
=end

    erb :delete
  end
  
end
