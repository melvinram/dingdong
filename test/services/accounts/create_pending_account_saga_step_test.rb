require 'test_helper'

module Accounts
  class CreatePendingAccountSagaStepTest < ActiveSupport::TestCase
    test '#step_forward creates pending account with valid params' do
      valid_account_params = { account: { name: 'Mel', subdomain: 'mel' } }
      outcome_data = {}

      Accounts::CreatePendingAccountSagaStep.new(
        params: valid_account_params,
        outcome_data: outcome_data
      ).step_forward

      account_id = outcome_data[:account_id]
      assert account_id, 'account id for new account not found in outcome data'

      account = ::Account.find(outcome_data[:account_id])
      assert account, 'account not found for account id collected'

      assert_equal 'mel', account.subdomain
      assert account.pending?, 'new account not in pending state'
      refute account.active?, 'new account is in active state'
    end

  end
end
