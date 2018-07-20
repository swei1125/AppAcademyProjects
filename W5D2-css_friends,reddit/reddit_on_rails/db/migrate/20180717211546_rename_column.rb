class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :parent_column_id

    add_column :comments, :parent_comment_id, :integer, index: true
  end
end
