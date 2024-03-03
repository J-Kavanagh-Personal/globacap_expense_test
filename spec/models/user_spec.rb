# frozen_string_literal: true
require 'rails_helper'
require_relative '../../app/models/user'

RSpec.describe User do
  subject { described_class.new(name: name) }
  let(:name) { Faker::Name.name }

  it 'created with a name' do
    is_expected.to have_attributes(:name => name)
  end
end
