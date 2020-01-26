class AddIsFixedToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :is_fixed, :boolean
  end
end
