module Accounts
  class CreateAccountSaga
    def self.run(params)
      new(params).run
    end

    attr_accessor :params

    def initialize(params = {})
      @params = params
    end
    
    def run
    
    end
  end
end