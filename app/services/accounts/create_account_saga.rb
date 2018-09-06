module Accounts
  class CreateAccountSaga
    def self.run(params)
      new(params).run
    end

    attr_accessor :params

    def initialize(params = {})
      @params = params
    end
    
    # Returns a SagaOutcome object
    def run
      steps.run
    end
    
    def steps
      SagaStepsRunner.new(
        params: params,
        steps: [
        CreatePendingAccountSagaStep,
        # CreateUserSagaStep,
        # ActivateAccountSagaStep
      ])
    end
  end
end
