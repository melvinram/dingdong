# frozen_string_literal: true

require 'test_helper'

class Accounts::SagaRunnerTest < ActiveSupport::TestCase
  class TestSagaStep < SagaStep
    def step_forward
      outcome_data[:test_saga_step_ran] ||= 0
      outcome_data[:test_saga_step_ran] += 1
    end
  end

  BASIC_PARAMS = { account: {} }

  test "runs steps" do
    params = BASIC_PARAMS

    steps = [TestSagaStep, TestSagaStep]
    outcome = Accounts::SagaRunner.new(steps: steps, params: params).run
    assert_equal 2, outcome.data[:test_saga_step_ran]
  end
end
