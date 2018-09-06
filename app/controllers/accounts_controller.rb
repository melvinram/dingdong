# frozen_string_literal: true

class AccountsController < ApplicationController
  def create
    outcome = Accounts::Account.create(account: accounts_params)
    if outcome.success?
      render json: { account: outcome.data[:account] }, status: :ok
    end
  end

  private

    def accounts_params
      params.require(:account).permit(:name, :subdomain, owner: [:email, :password])
    end
end
