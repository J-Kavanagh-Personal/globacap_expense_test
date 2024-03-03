# frozen_string_literal: true
require 'rails_helper'
require_relative '../../app/models/expense'

RSpec.describe Expense do
  subject { described_class.new(user_id: user.id, amount_in_pennies: 100) }
  let(:user) { FactoryBot.create(:user) }

  it 'created with amount in pennies' do
    is_expected.to have_attributes(:amount_in_pennies => 100)
  end
end
