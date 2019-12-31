class AddKindToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :kind, :string
  end
end
