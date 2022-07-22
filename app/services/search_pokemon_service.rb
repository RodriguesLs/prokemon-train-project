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

    return failure if response.body == 'Not Found'

    success(response)
  end

  private

  def success(response)
    OpenStruct.new(failure?: false, abilities: ordered_abilities(response.body))
  end

  def failure
    OpenStruct.new(failure?: true, message: 'Pokemon not found, try again')
  end

  def ordered_abilities(body)
    pokemons = JSON.parse(body)

    pokemons['abilities'].map { |a| a['ability']['name'] }.sort
  end

  def search_params
  end
end
