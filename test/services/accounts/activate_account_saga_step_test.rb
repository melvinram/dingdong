# frozen_string_literal: true

require 'test_helper'

module Accounts
  class ActivateAccountSagaStepTest < ActiveSupport::TestCase
    test '#step_forward activates account' do
      params = {}
      account = ::Account.create(name: 'x', subdomain: 'x')
      assert ::Account::PENDING, account.state
      outcome_data = { account: { id: 1, name: 'x', subdomain: 'x' } }

      Accounts::ActivateAccountSagaStep.new(
        params: params,
        outcome_data: outcome_data
      ).step_forward

      account = ::Account.find(1)
      assert_equal ::Account::ACTIVE, account.state
      assert_equal :active, outcome_data.dig(:account, :state)
    end

    test '#step_back deactivates account' do
      skip
    end
  end
end
