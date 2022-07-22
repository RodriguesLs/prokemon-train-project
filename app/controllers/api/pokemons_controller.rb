# frozen_string_literal: true

module Api
  class PokemonsController < ApplicationController
    def search
      result = pokemon_search(params[:pokemon_name])

      return render json: { message: result.message }, status: 404 if result.failure?

      render json: result.abilities
    end

    private

    def pokemon_search(pokemon_name)
      SearchPokemonService.perform(pokemon_name)
    end
  end
end
