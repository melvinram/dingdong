require 'test_helper'

class Accounts::CreatePendingAccountSagaStepTest < ActiveSupport::TestCase
  test 'runs steps' do
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
  end
end
