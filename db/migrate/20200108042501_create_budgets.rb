class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.references :category
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
  end
end
