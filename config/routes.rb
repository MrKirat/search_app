Rails.application.routes.draw do
  resources :programming_languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'programming_languages#index'
end
