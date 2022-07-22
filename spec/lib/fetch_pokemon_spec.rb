# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PokeApi::FetchPokemon', type: :request do
  subject(:poke_api) { PokeApi::FetchPokemon.perform(pokemon_name) }
  
  describe 'GET #pokemon' do
    let(:pokemon_name) { 'ditto' }

    it { expect(poke_api).to be_success }
    it { expect(JSON.parse(poke_api.body)['abilities']).not_to be_nil }
  end
end
