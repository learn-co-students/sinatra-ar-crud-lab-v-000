require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do
    	set :public_folder, 'public'
		set :views, 'app/views'
	end

	get '/' do
		@articles = Article.all
		erb :index
	end

	get "/youstupid" do
		"You are not stupid, however someone is because there was an error... \n Hmmm maybe it is you afterall?"
	end
end
