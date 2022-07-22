# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PokemonsController, type: :request do
  describe '#search' do
    subject(:get_search) { get("/api/pokemons/#{pokemon_name}") }

    context 'when success' do
      let(:pokemon_name) { 'ditto' }

      before { get_search }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when failure' do
      let(:pokemon_name) { 'kkk' }

      before { get_search }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(json['message']).to eq('Pokemon not found, try again') }
    end
  end
end
