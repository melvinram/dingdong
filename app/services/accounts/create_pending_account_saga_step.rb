# frozen_string_literal: true

module Accounts
  class CreatePendingAccountSagaStep < SagaStep
    def step_forward
      account = ::Account.new(account_params)

      if account.save
        outcome_data[:account] = {
          id: account.id,
          name: account.name,
          subdomain: account.subdomain
        }
      end
    end

    private

      def account_params
        {
          name: params.dig(:account, :name),
          subdomain: params.dig(:account, :subdomain),
        }
      end
  end
end
