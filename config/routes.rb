Rails.application.routes.draw do
  root   'pages#home'
  get    'sessions/new'
  get    '/job_posts',      to: 'job_posts#index'
  get    '/job_posts/new',  to: 'job_posts#new'
  get    '/dashboard',      to: 'users#index'
  get    '/register',       to: 'users#new'
  get    '/freelancer',     to: 'users#freelancer'
  get    '/login',          to: 'sessions#new'
  post   '/login',          to: 'sessions#create'
  delete '/logout',         to: 'sessions#destroy'
  resources :job_posts,     only: [:new, :create, :edit, :update, :destroy]
  resources :users
end
