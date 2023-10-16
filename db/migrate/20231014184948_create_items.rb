class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :customer_id
      t.integer :category_id
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :area, null: false
      t.string :store, null: false
      t.timestamps
    end
  end
end
