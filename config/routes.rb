Rails.application.routes.draw do
  namespace :api do
    resources :responses
  end
  scope "(:locale)", :locale => /en|de/ do
    root  'static#hello'
    match '/configure', to: 'static#hello', via: 'get'
  end
end
