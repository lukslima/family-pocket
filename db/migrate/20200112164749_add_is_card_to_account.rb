class AddIsCardToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :is_card, :boolean, default: false
  end
end
