# frozen_string_literal: true

module Api
  class PokemonsController < ApplicationController
    def search
      result = pokemon_search(params[:pokemon_name])
 
      render json: ordered_abilities(JSON.parse(result.body))
    end

    private

    def pokemon_search(pokemon_name)
      PokeApi::FetchPokemon.perform(pokemon_name)
    end

    def ordered_abilities(pokemons)
      pokemons['abilities'].map { |a| a['ability']['name'] }.sort
    end
  end
end
