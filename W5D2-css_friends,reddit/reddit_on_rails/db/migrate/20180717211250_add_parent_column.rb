class AddParentColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :parent_column_id, :integer, index: true
  end
end
