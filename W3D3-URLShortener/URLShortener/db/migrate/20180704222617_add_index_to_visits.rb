class AddIndexToVisits < ActiveRecord::Migration[5.1]
  def change
    add_index :Visits, :user_id
  end
end
