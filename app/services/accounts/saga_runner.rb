# frozen_string_literal: true

module Accounts
  class SagaRunner
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

      outcome.result = SagaOutcome::SUCCESS
      outcome
    end

    class SagaOutcome
      INCOMPLETE = 0
      SUCCESS = 1
      FAILURE = 2

      attr_accessor :data, :result, :errors

      def initialize(data:)
        @data = data
        @result = INCOMPLETE
        @errors = []
      end

      # untested
      def success?
        @result == SUCCESS
      end
    end
  end
end
