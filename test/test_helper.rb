# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require_relative './support/factory_bot'
require 'rails/test_help'

class ActiveSupport::TestCase
  FactoryBot.find_definitions
end
