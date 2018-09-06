class AddStateToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :state, :integer, default: 0
    add_index :accounts, :state
  end
end
