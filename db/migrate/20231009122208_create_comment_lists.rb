class CreateCommentLists < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_lists do |t|

      t.integer :customer_id, null: false
      t.integer :item_id, null: false
      t.timestamps
    end
  end
end
