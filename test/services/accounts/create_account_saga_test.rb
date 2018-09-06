# frozen_string_literal: true

require 'test_helper'

class Accounts::CreateAccountSagaTest < ActiveSupport::TestCase
  test "account creation with valid params" do
    valid_owner_params = { email: "mel@example.com", password: "123456" }
    valid_account_params = { name: "Melvin Ram", subdomain: "mel", owner: valid_owner_params }

    params = { account: valid_account_params }
    outcome = Accounts::CreateAccountSaga.run(params)

    account = ::Account.where(subdomain: 'mel').first

    assert account, 'account creation failed'
    assert_equal account.id, outcome.data[:account_id], "account id mismatch"
    # assert account.active?, 'new account not in active state'

    account_owner = ::User.where(account_id: account.id).first
    assert account_owner, 'account owner not created'
    # assert outcome.data[:owner], 'account owner not present in outcome'
  end
end
