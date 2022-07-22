Rails.application.routes.draw do
  get 'health', to: 'application#health'

  namespace :api do
    get 'pokemons/:pokemon_name', to: 'pokemons#search', as: 'pokemon_search'
  end
end
