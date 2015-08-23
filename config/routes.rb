Rails.application.routes.draw do
  # Routes for the Task resource:
  # CREATE
  get "/tasks/new", :controller => "tasks", :action => "new"
  post "/create_task", :controller => "tasks", :action => "create"

  # READ
  get "/tasks", :controller => "tasks", :action => "index"
  get "/tasks/:id", :controller => "tasks", :action => "show"

  # UPDATE
  get "/tasks/:id/edit", :controller => "tasks", :action => "edit"
  post "/update_task/:id", :controller => "tasks", :action => "update"

  # DELETE
  get "/delete_task/:id", :controller => "tasks", :action => "destroy"
  #------------------------------

  # Routes for the Task_occurrence resource:
  # CREATE
  get "/task_occurrences/new", :controller => "task_occurrences", :action => "new"
  post "/create_task_occurrence", :controller => "task_occurrences", :action => "create"

  # READ
  get "/task_occurrences", :controller => "task_occurrences", :action => "index"
  get "/task_occurrences/:id", :controller => "task_occurrences", :action => "show"

  # UPDATE
  get "/task_occurrences/:id/edit", :controller => "task_occurrences", :action => "edit"
  post "/update_task_occurrence/:id", :controller => "task_occurrences", :action => "update"

  # DELETE
  get "/delete_task_occurrence/:id", :controller => "task_occurrences", :action => "destroy"
  #------------------------------

  devise_for :users
root 'task_occurrences#index'


end
