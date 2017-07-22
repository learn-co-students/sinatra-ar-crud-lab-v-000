list
  - has many list items
   -a lot of list items
list_item
  -belong to list
  -name
  -list_id = foreign key
Create a controller action,
get '/posts/:id/edit', that renders the view, edit.erb. This view should contain a form to update a specific blog post and POSTs to a controller action, patch '/posts/:id'
