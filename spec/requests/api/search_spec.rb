# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/pokemons/:pokemon_name', type: :request do
  describe 'GET #search' do
    subject(:get_pokemon) { get api_pokemon_search_path(pokemon_name: pokemon_name) }

    context 'when success' do
      let(:pokemon_name) { 'ditto' }

      xit { expect(response).to have_http_status(200) }
    end
  end
end