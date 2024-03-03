# frozen_string_literal: true

FactoryBot.define do
  factory(:user) do
    name { Faker::Name.name }
  end
  factory(:expense) do
    amount_in_pennies { Faker::Number.number(digits: 5) }
  end
end