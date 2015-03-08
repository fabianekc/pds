Rails.application.routes.draw do
  get "message/show"
  root 'static#hello'
end
