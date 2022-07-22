# frozen_string_literal: true

module Api
  class PokemonsController < ApplicationController
    def search
      result = pokemon_search(params[:pokemon_name])
      parsed_response = JSON.parse(result.body)
 
      render json: parsed_response
    end

    private

    def pokemon_search(pokemon_name)
      PokeApi::FetchPokemon.perform(pokemon_name)
    end
  end
end
