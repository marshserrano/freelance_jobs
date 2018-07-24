Rails.application.routes.draw do
  get 'message/new'
  root   'pages#home'
  get    'sessions/new'
  get    '/messages',           to: 'messages#index'
  get    '/messages/new',       to: 'messages#new'
  get    '/messages/:id',       to: 'messages#show', as: 'profile'
  get    '/job_posts',          to: 'job_posts#index'
  get    '/job_posts/new',      to: 'job_posts#new'
  get    '/job_posts/:id',      to: 'job_posts#show'
  get    '/dashboard',          to: 'users#index'
  get    '/register',           to: 'users#new'
  get    '/freelancer',         to: 'users#freelancer'
  get    '/active_jobs',        to: 'users#active_jobs'
  get    '/completed',          to: 'users#completed_jobs'
  get    '/invites',            to: 'users#job_invitations'
  get    '/invitations',        to: 'users#job_invites'
  get    '/applicants',         to: 'users#job_applicants'
  get    '/applications',       to: 'users#job_applications'
  get    '/user_profile/:id',   to: 'users#user_profile', as: :user_profile
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  resources :job_posts,         only: [:new, :create, :edit, :update, :destroy]
  resources :users
  resources :messages,          only: [:index, :create, :new, :show, :destroy]
end
