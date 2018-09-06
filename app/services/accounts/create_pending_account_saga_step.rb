module Accounts
  class CreatePendingAccountSagaStep < SagaStep
    def step_forward
      account = ::Account.new(account_params)
      account.save
    end
    
    # def step_back
    #
    # end
    
    private
    
    def account_params
      {
        name: params[:account][:name],
        subdomain: params[:account][:subdomain],
      }
    end
  end
end
