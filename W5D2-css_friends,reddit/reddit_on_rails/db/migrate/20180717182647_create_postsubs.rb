class CreatePostsubs < ActiveRecord::Migration[5.1]
  def change
    create_table :postsubs do |t|
      t.integer :sub_id, index: true, null: false
      t.integer :post_id, index: true, null: false

      t.timestamps
    end
  end
end
