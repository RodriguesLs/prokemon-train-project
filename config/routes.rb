Rails.application.routes.draw do
  get 'health', to: 'application#health'
end
