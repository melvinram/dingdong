module Accounts
  class SagaStep
    attr_accessor :params, :outcome_data
  
    def initialize(params:, outcome_data:)
      @params = params
      @outcome_data = outcome_data
    end
  
    def step_forward
      raise NotImplementedError, 'must be implemented by each step'
    end
  end
end
