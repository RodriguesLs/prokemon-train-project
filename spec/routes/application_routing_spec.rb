# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/health', type: :routing do
  it { expect(get: '/health').to route_to('application#health') }
end
