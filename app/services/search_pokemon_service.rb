# frozen_string_literal: true

class SearchPokemonService
  attr_reader :pokemon_name, :pokemon

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
    @pokemon = JSON.parse(response.body)

    OpenStruct.new(failure?: false, name: name, abilities: ordered_abilities)
  end

  def failure
    OpenStruct.new(failure?: true, message: 'Pokemon not found, try again')
  end

  def name
    pokemon['name']
  end

  def ordered_abilities
    pokemon['abilities'].map { |a| a['ability']['name'] }.sort
  end

  def search_params
  end
end
