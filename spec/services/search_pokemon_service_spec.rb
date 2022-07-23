# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchPokemonService do
  let(:mock_response) do
    {
      name: 'ditto',
      abilities: [
        {
          ability: {
            name: 'limber',
            url: 'https://pokeapi.co/api/v2/ability/7/'
          },
          is_hidden: false,
          slot: 1
        },
        {
          ability: {
            name: 'imposter',
            url: 'https://pokeapi.co/api/v2/ability/150/'
          },
          is_hidden: true,
          slot: 3
        }
      ]
    }.to_json
  end

  describe '.perform' do
    subject(:search_service) { described_class.perform('ditto') }

    context 'when success' do
      before { allow(PokeApi::FetchPokemon).to receive(:perform).and_return(OpenStruct.new(body: mock_response)) }

      it { expect(search_service.abilities).to contain_exactly('imposter', 'limber') }
      it { expect(search_service.name).to eq('ditto') }
    end
  end
end
