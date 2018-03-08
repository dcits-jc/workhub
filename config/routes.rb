Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/users#index'  

  # 管理员路由
  namespace :admin do
    resources :users do
      member do
        post :reset_password
      end
    end
    resources :teams
  end
  


  # api
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      # resources :users, only: [:index, :show]
      # 用户搜索
      get "/users/:search"  => "users#search", as: :users
      # 团队搜索
      get "/teams/:search"  => "teams#search", as: :teams
    end
  end


end
