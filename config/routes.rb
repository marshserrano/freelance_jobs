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
      get '/hire',      to: 'messages#hire'
      get '/accept',    to: 'messages#accept'
      get '/decline',   to: 'messages#decline'
      get '/complete',  to: 'messages#complete'
    end
    collection do
      resources :invitations
      resources :applications
      get '/applicants',    to: 'messages#job_applicants'
      get '/invites',       to: 'messages#job_invites'
      get '/active',        to: 'messages#jobs_active'
      get '/completed',     to: 'messages#jobs_completed'
    end
  end
  resources :job_posts
  resources :users
end
