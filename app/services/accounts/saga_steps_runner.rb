module Accounts
  class SagaStepsRunner
    attr_accessor :steps, :params, :outcome_data, :outcome
    
    def initialize(params:, steps:)
      @steps = steps
      @params = params
      @outcome_data = {}
      @outcome = SagaOutcome.new(data: @outcome_data)
    end
    
    def run
      steps.each do |step|
        step.new(params: params, outcome_data: outcome_data).step_forward
      end
      
      outcome
    end
    
    class SagaOutcome
      attr_accessor :data
      def initialize(data:)
        @data = data
      end
    end
  end
end