Rails.application.routes.draw do
  resources :tasks
  resources :task_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'task_lists#new'
end
