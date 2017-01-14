Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :tasks, only: [:show, :edit, :destroy, :update]

    resources :task_lists, except: [:new] do
      resources :tasks, except: [:index, :edit, :show, :destroy, :update]
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'task_lists#new'
  end
# => Produce un loop:
#  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), via: [:get, :post]
  match '', to: redirect("/#{I18n.default_locale}"), via: [:get, :post]
end
