require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "create account" do
    post "/accounts", params: {
      account: {
        name: 'Melvin Ram',
        subdomain: 'mel',
        owner: {
          email: 'mel@example.com',
          password: '123456'
        }
      }
    }
    
    account = Account.where(subdomain: 'mel').first
    assert account, 'account not created'
  end
end
