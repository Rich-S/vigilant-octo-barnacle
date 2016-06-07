Rails.application.routes.draw do
  resources :users
  resources :projects do 
    collection do
      get "index_users"
      get "index_materials"
    end
  end
  root 'projects#index'
  #root 'static_pages#home'
end
