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
      get :verify
    end
  end


  resources :categories

  resources :subscriptions do
    member do
      get :verify
    end
  end

  get "/pages/:action" , :controller => "pages"

  
  resources :day_jobs do 
    collection do
      get :inform
      post :preview
      get :search
      get :final
    end

    member do
      post :publish
      get :verify
    end
  end
  
  
end
