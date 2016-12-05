Rails.application.routes.draw do
  resources :tasks, only: [:show, :edit, :destroy, :update]

  resources :task_lists do
    resources :tasks, except: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'task_lists#new'
end
