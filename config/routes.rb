Rails.application.routes.draw do
  get 'employers/index'
  get 'employers/show'
  get 'message/new'
  root   'pages#home'
  get    'sessions/new'

  #messages
  get    '/messages',           to: 'messages#index'
  get    '/messages/new',       to: 'messages#new'
  get    '/messages/:id',       to: 'messages#show', as: 'profile'
  post   '/messages/:id',       to: 'messages#status'
  get    '/invitations',        to: 'messages#job_invitations'
  get    '/applicants',         to: 'messages#job_applicants'
  get    '/applications',       to: 'messages#job_applications'
  get    '/invites',            to: 'messages#job_invites'
  get    '/active',             to: 'messages#jobs_active'
  get    '/completed',          to: 'messages#jobs_completed'
  get    '/messages/:id/hire',  to: 'messages#hire',          as: 'hire'
  get    '/messages/:id/accept',    to: 'messages#accept',    as: 'accept'
  get    '/messages/:id/decline',   to: 'messages#decline',   as: 'decline'
  get    '/messages/:id/complete',  to: 'messages#completed', as: 'complete'

  #job_posts
  get    '/job_posts',          to: 'job_posts#index'
  get    '/job_posts/new',      to: 'job_posts#new'
  get    '/job_posts/:id',      to: 'job_posts#show'

  #freelancer
  get    '/freelancers',        to: 'freelancers#index'
  get    '/freelancers/:id',    to: 'freelancers#show', as: 'freelancer_profile'

  #employer
  get    '/employers',          to: 'employers#index'
  get    '/employers/:id',      to: 'employers#show', as: 'employer_profile'

  #users
  get    '/dashboard',          to: 'users#index'
  get    '/register',           to: 'users#new'

  #sessions
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'

  #resources
  resources :messages,          only: [:index, :create, :new, :show, :destroy]
  resources :job_posts,         only: [:new, :create, :edit, :update, :destroy]
  resources :users

end
