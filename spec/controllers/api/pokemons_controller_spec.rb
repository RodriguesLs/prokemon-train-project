# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :controller do
  describe '#search' do
    subject(:get_search) { get api_pokemon_search_path(pokemon_name: pokemon_name) }

    context 'when success' do
      let(:pokemon_name) { 'ditto' }

      it { expect(response).to have_http_status(200) }
    end
  end
end
