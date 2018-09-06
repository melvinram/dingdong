class AccountsController < ApplicationController
  def create
    Accounts::Account.create(account: accounts_params)
  end
  
  private
  
  def accounts_params
    params.require(:account).permit(:name, :subdomain, owner: [:email, :password])
  end
end
