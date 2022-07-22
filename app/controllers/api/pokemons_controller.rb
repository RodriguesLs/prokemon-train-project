# frozen_string_literal: true

module Api
  class PokemonsController < ApplicationController
    def search
      abilities = pokemon_search(params[:pokemon_name])
 
      render json: abilities
    end

    private

    def pokemon_search(pokemon_name)
      SearchPokemonService.perform(pokemon_name)
    end
  end
end
