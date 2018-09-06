# frozen_string_literal: true

module Accounts
  class ActivateAccountSagaStep < SagaStep
    def step_forward
      account = ::Account.find(outcome_data.dig(:account, :id))
      if account.activate
        outcome_data[:account][:state] = account.state_name
      else
        # TODO
      end
    end

    def step_back
      account = ::Account.find(outcome_data.dig(:account, :id))
      if account.deactivate
        outcome_data[:account][:state] = account.state_name
      else
        # TODO
      end
    end
  end
end