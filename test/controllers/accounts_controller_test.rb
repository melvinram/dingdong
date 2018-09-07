# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test '#create with valid parameters' do
    valid_params = { account: attributes_for(:account) }
    valid_params[:account][:owner] = attributes_for(:user)

    post "/accounts.json", params: valid_params

    account = Account.where(subdomain: 'mel').first

    success_response_code = 200
    assert_equal success_response_code, response.status

    assert account, 'account not created'
    assert_equal 'mel', account.subdomain

    response_hash = JSON.parse(response.body)
    assert response_hash.dig('account', 'id'), 'response does not contain account id'

    account_owner_id = response_hash.dig('account', 'owner', 'id')
    assert account_owner_id, 'response does not contain account owner id'

    owner = User.where(account_id: account.id, id: account_owner_id).first
    assert owner, 'account owner not created'
    assert_equal 'mel@example.com', owner.email
  end

  test "#create with invalid parameters" do
    skip
  end
end
