# frozen_string_literal: true

class SearchPokemonService
  attr_reader :pokemon_name

  def initialize(pokemon_name)
    @pokemon_name = pokemon_name
  end

  def self.perform(*args)
    new(*args).perform
  end

  def perform
    response = PokeApi::FetchPokemon.perform(pokemon_name)

    ordered_abilities(response.body)
  end

  private

  def ordered_abilities(body)
    pokemons = JSON.parse(body)

    pokemons['abilities'].map { |a| a['ability']['name'] }.sort
  end

  def search_params
  end
end
