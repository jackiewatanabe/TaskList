Rails.application.routes.draw do
  # get 'tasks/show'
  #
  # get 'tasks/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'tasks/new', to: 'tasks#new'
  post 'tasks', to: 'tasks#create'

  get '/tasks', to: 'tasks#index'
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get 'tasks/edit/:id', to: 'tasks#edit', as: 'task_edit'
  put 'tasks/:id', to: 'tasks#update'
end