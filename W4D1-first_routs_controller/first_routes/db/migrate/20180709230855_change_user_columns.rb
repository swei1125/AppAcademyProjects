class ChangeUserColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    
    remove_column :users, :name, :email
  end
end
