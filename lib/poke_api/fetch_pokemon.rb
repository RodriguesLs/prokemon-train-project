# frozen_string_literal: true

module PokeApi
  class FetchPokemon < Base
    def perform(pokemon_name)
      Faraday.get("https://pokeapi.co/api/v2/pokemon/#{pokemon_name}")
    end
  end
end
