Rails.application.routes.draw do
  
  # --- API ------------------------------------
  
  namespace :api_v1 do
    resources :procedures do
      member do
        get :arguments_combined
      end
    end
  end
  
  # --- WEB ------------------------------------
  
  resources :exports
  
  resources :receipts
  get 're/:id' => 'receipts#edit', as: 'answer_receipt'
  
  resources :ratings do
    member do
      put :relay
    end
  end
  get 'ra/:id' => 'ratings#answer', as: 'answer_rating'
  
  resources :follows
  
  resources :favs
  
  resources :comments do
    member do
      put :fav
      put :unfav
      put :approve
    end
    
    resources :ratings
  end
  
  resources :arguments do
    member do
      put :fav
      put :unfav
      put :approve
    end
    
    resources :comments
    resources :ratings
  end
  
  resources :attachments
  
  resources :procedures do
    member do
      put :activate
      put :approve
      get :intro_what
      get :intro_views
      get :intro_actions
      get :vote
      get :result
      get :embed
    end
    
    resources :attachments
    resources :arguments
    resources :follows
    
    resources :receipts
    
    resources :exports
  end
  
  resources :periods
  
  resources :bodies do
    member do
      get :graph
    end
    
    resources :procedures do
      collection do
        get :coming
        get :most_contributed
        get :most_faved
      end
    end
    resources :subjectgroups do
      resources :procedures
    end
  end
  
  resources :moderatorships
  
  resources :visitors do
    member do
      put :send_confirmation
      get :confirm
    end
    
    resource :account
    resources :arguments
    resources :comments
    resources :favs
    resources :follows
    resources :ratings
  end
  get 'lo/:id' => 'visitors#login', as: 'login_visitor'
  
  resources :accounts do
    member do
      get :set_password
    end
  end
  
  controller :info do
    get 'info/impressum', to: redirect( 'https://gremien.teilt-mit.de/info/impressum' )
    get 'info/datenschutz', to: redirect( 'https://gremien.teilt-mit.de/info/datenschutz' )
    get 'info/details', to: redirect( 'https://gremien.teilt-mit.de/info/details' )
    
    get :cockpit
    get :history
    get :approval
    get :contribution_rules
    get :why
    put :close_dialog
    get 'info/tick_moderation' => 'info#tick_moderation'
    
    get 'info/logs' => 'info#logs'
    
    get 'info/:id' => :show
  end
  
  
  
  # --- Login / Logout Requests ----------------
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  put '/reset_password', to: 'accounts#reset_password'
  
  # --- Log ------------------------------------
  
  resources :logs
  
  # Redirect existing gremieninfo posts
  get '/posts/:id', to: redirect( "https://gremien.teilt-mit.de/posts/%{id}" )
  
  # Redirect unsubscriptions tu gremien.teilt-mit.de
  get '/newssubscriptions/*other', to: redirect { |pp, req| req.original_url.to_s.gsub( '//teilt', '//gremien.teilt' ) }
  
  get '/help', to: 'application#help'
  
  get '/logout', to: 'application#logout'
  
  root to: 'application#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
