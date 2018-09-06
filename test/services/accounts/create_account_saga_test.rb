require 'test_helper'

class Accounts::CreateAccountSagaTest < ActiveSupport::TestCase
  test "account creation with valid params" do
    valid_owner_params = { email: "mel@example.com", password: "12345" }
    valid_account_params = { name: "Melvin Ram", subdomain: "mel", owner: valid_owner_params }
    
    params = { account: valid_account_params }
    outcome = Accounts::CreateAccountSaga.run(params)
    
    account = ::Account.where(subdomain: 'mel').first
    
    assert account, "account creation failed"
  end
end
