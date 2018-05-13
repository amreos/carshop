Rails.application.routes.draw do

  #mount Ckeditor::Engine => '/ckeditor'
  mount Ckeditor::Engine => '/ckeditor'

  resources :pictures, only: [:index, :create, :destroy]
  resources :attachment_files, only: [:index, :create, :destroy]

  namespace :admin do
    resources :users
  resources :comments
  resources :listings
  resources :posts

    root to: "users#index"
  end



  get 'static_pages/contact'

  get 'static_pages/about'

  get 'static_pages/privacy'

  get 'static_pages/terms'

  get 'static_pages/services'

  get 'static_pages/faq'

  resources :users, only: [:show, :edit, :update]

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  #devise_for :users
  resources :listings

  resources :posts do
   resources :comments
   end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'shared#home'
   #root 'posts#index'

   get   'listings/search', to: 'listings#search'
   post 'listings/search', to: 'listings#search'
   post  'listings/index', to: 'listings#index'


   #match '*a', to: 'errors#routing',   via: [:get, :post]

  
end
