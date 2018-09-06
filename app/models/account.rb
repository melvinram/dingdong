class Account < ApplicationRecord
  PENDING = 0
  ACTIVE = 1
  STATES = { PENDING => :pending, ACTIVE => :active }

  def pending?
    state == PENDING
  end

  def active?
    state == ACTIVE
  end

  def state_name
    STATES[state]
  end
end
