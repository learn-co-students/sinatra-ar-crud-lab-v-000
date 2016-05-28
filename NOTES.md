-----NOTES-----

****||CREATE||****

1) create the migrate file to create the table 
2) run 'rake db:migrate command'

3) set a controller 'get' action to render a view from 'new.erb' file
4) create the 'new.erb' file in the views folder
5) In the 'new.erb' file, create a form tag with method='POST' and action='/posts' as well as inputs for the post name and post content and add a submit button.
6) Go back to the app controler and add the 'post' action to '/posts'...
7) ...in the post method, create a new instance of the Post class object with '@post = Post.new(params)'
8) add below "redirect to '/posts'" --> so #6-8 is the route to create a new post

****||READ||****

9) make a new file in the 'views' dir called 'index.erb'
10) back in the controller, add a 'get' route to '/posts' that renders from 'index.erb'
11) 'index.erb' will iterate over all @posts to render on the page 
12) create the 'show.erb' file in 'views' dir which will show an individual post
13) follow up by creating the controller action "get '/posts/:id" to render on 'show.erb' where the method '.find_by_id(params[:id])' is assigned to '@post'

****||UPDATE||****

14) create controller action "get '/posts/:id/edit" that renders 'edit/erb' (so now go ahead to create also the 'edit.erb' file)
15) In 'edit.erb' set the form action to "/posts/<%=@post.id%>" (dynamic)
16) Once the edit form is submitted it should be rendered in 'show.erb'. Use the 'patch' request when creating the controller route
17) in the patch route, find the post by id, then assign the new name and content to the @post attributes of the same name. Save it.

****||DELETE||****

18) create the delete controller action "delete '/posts/:id/delete"
19) since there is no delete view, add a 'Delete' button in 'show.erb'
20) finally, in 'show.erb' make sure the form includes the hidden input tag to change the request from 'post' to 'delete'.
21) rendered the delete route to 'deleted.erb'.