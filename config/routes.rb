Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :plots
  resources :gardens
  delete '/plots/:plot_id/plants/:id', to: 'plot_plants#destroy'
end
