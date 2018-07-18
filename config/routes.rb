Rails.application.routes.draw do
  root   'pages#home'
  get    'sessions/new'
  get    '/job_posts',     to: 'job_posts#index'
  get    '/job_posts/new', to: 'job_posts#new'
  get    '/dashboard',    to: 'users#index'
  get    '/register',     to: 'users#new'
  get    '/index',        to: 'users#freelancer'
  get    '/index',        to: 'users#employer'
  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  delete '/logout',       to: 'sessions#destroy'
  resources :job_posts
  resources :users
end
