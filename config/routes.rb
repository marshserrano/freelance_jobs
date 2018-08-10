Rails.application.routes.draw do
  root 'pages#home'
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  get    '/freelancers',        to: 'freelancers#index'
  get    '/freelancers/:id',    to: 'freelancers#show', as: 'freelancer_profile'
  get    '/employers/:id',      to: 'employers#show', as: 'employer_profile'

  resources :invitations do
    member do
      get '/accept',    to: 'invitations#accept'
      get '/decline',   to: 'invitations#decline'
      get '/delete',    to: 'invitations#destroy'
    end
  end
  resources :applications do
    member do
      get '/accept',    to: 'applications#accept'
      get '/delete',    to: 'applications#destroy'
    end
  end
  resources :active_jobs do
    member do
      get '/complete',  to: 'active_jobs#complete'
    end
  end
  resources :completed_jobs
  resources :job_posts
  resources :users
  resources :messages
end
