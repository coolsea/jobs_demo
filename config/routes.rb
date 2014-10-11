Rails.application.routes.draw do
  
  
  mount RailsAdmin::Engine => '/cadmin', as: 'rails_admin'
  root :to => "jobs#index"
  
  devise_for :users
  
  resources :jobs do 
    collection do 
      get :inform
      post :preview

      get :search
      get :final
    end

    member do 
      post :publish
    end
  end
  
  
  resources :categories

end
