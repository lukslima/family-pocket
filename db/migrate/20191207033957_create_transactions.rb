class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :value, precision: 8, scale: 2
      t.date :date
      t.references :account, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
