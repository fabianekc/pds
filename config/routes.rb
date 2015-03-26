Rails.application.routes.draw do
  namespace :api do
    resources :responses, defaults: {format: 'json'}
  end
  scope "(:locale)", :locale => /en|de/ do
    root  'static#login'
    resources :sessions, only: [:new, :create, :destroy]
    match '/configure',  to: 'static#configure',  via: 'get'
    match '/config1',    to: 'static#config1',    via: 'get'
    match '/config_end', to: 'static#config_end', via: 'get'
    match '/password',   to: 'static#password',   via: 'post'
    match '/overview',   to: 'static#overview',   via: 'get'
    match '/logout',     to: 'sessions#destroy',  via: 'get'
    match '/logout',     to: 'sessions#destroy',  via: 'delete'
  end
end
