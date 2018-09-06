# frozen_string_literal: true

module Accounts
  class Account
    class << self
      def create(params = {})
        saga_outcome = Accounts::CreateAccountSaga.run(params)
      end
    end
  end
end
