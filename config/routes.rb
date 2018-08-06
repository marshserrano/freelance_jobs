Rails.application.routes.draw do
  root 'pages#home'
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
  get    '/freelancers',        to: 'freelancers#index'
  get    '/freelancers/:id',    to: 'freelancers#show', as: 'freelancer_profile'
  get    '/employers/:id',      to: 'employers#show', as: 'employer_profile'

  resources :messages do
    member do
      get '/hire',      to: 'applications#hire'
      get '/accept',    to: 'invitations#accept'
      get '/decline',   to: 'invitations#decline'
      get '/complete',  to: 'active_jobs#complete'
    end
    collection do
      resources :invitations
      resources :applications
      resources :active_jobs
      get '/completed',     to: 'messages#jobs_completed'
    end
  end
  resources :job_posts
  resources :users
end
