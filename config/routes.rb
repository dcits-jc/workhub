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
    resources :teams do
      member do
        post :delete_parents
        post :delete_children
      end
    end
    resources :projects do
      member do
        post :set_disabled
        post :set_enabled
      end
    end

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

  namespace :wechatpage do
    resources :users do
      collection do
        get :user_search 

        # 学历选择
        get :user_degree_choice

        get :user_has_idcard
        get :user_has_resume
        get :user_degree_college 
        get :user_degree_university 
        get :user_degree_master 
        get :user_degree_doctor 
      end
    end
  end


  # 头像动态生成
  get "avatar/:size/:background/:text" => Dragonfly.app.endpoint { |params, app|
    app.generate(:initial_avatar, URI.unescape(params[:text]), { size: params[:size], background_color: params[:background] })
  }, as: :avatar


end
