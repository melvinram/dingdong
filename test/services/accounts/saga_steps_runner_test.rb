require 'test_helper'

class Accounts::SagaStepsRunnerTest < ActiveSupport::TestCase
  class TestSagaStep
    attr_accessor :params, :outcome_data
    
    def initialize(params:, outcome_data:)
      @params = params
      @outcome_data = outcome_data
    end
    
    def step_forward
      outcome_data[:test_saga_step_ran] ||= 0
      outcome_data[:test_saga_step_ran] += 1
    end
  end
  
  BASIC_PARAMS = { account: {} }
  
  test "runs steps" do
    params = BASIC_PARAMS
    
    steps = [TestSagaStep, TestSagaStep]
    outcome = Accounts::SagaStepsRunner.new(steps: steps, params: params).run
    assert_equal 2, outcome.data[:test_saga_step_ran]
  end
end
