# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :user do
    email    { "mel@example.com" }
    password { "123456" }
  end
end
