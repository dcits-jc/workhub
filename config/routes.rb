Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'feeds#week'  

  # 信息流
  resources :feeds do
    collection do
      get :week
    end
  end

  # 团队信息流
  resources :teams do
    collection do
      get :week
    end
  end

  resources :projects

  resources :users do
    member do
      get :week
    end
  end

  # 工作流
  resources :project_workflows
  resources :management_workflows

  # 管理员路由
  namespace :admin do
    resources :feeds
    resources :users do
      member do
        post :reset_password
        post :set_admin
        post :cancel_admin
      end
    end
    resources :teams
    resources :projects

  end
  


  # demo测试页面
  resources :landingpage do
    collection do
      get :demo
      get :faq
    end
  end



  # api
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      # resources :users, only: [:index, :show]
      # 用户搜索
      get "/users/:search"  => "users#search", as: :users
      # 团队搜索
      get "/teams/:search"  => "teams#search", as: :teams
      # 团队搜索
      get "/projects/:search"  => "projects#search", as: :projects
    end
  end


  # 头像动态生成
  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background] })
  }, as: :avatar


end
