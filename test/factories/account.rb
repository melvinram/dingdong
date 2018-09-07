# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :account do
    name      { "Mel" }
    subdomain { "mel" }
  end
end
