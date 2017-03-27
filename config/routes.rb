Rails.application.routes.draw do
  # get 'tasks/show'
  #
  # get 'tasks/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'task#index'

  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  post 'tasks', to: 'tasks#create'

  get '/tasks', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get 'tasks/edit/:id', to: 'tasks#edit', as: 'edit_task'
  put 'tasks/:id', to: 'tasks#update'

  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'
end
