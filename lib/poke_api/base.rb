# frozen_string_literal: true

module PokeApi
  class Base
    def initialize
      @connection = Faraday.new(url: 'https://pokeapi.co/api/v2')
      @connection.headers['Content-Type'] = 'application/json'
    end

    def self.perform(*args)
      new.perform(*args)
    end

    def perform
      raise Exception::NotImplementedError
    end
  end
end
