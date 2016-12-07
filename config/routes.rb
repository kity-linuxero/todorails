Rails.application.routes.draw do
  resources :tasks, only: [:show, :edit, :destroy, :update]

  resources :task_lists, except: [:new] do
    resources :tasks, except: [:index, :edit, :show, :destroy, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'task_lists#new'
end
