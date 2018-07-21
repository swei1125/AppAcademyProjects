class AddIndexToCat < ActiveRecord::Migration[5.1]
  def change
    add_index :cats, :name
  end
end
