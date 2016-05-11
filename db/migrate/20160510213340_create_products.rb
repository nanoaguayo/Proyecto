class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.string :image

      t.timestamps null: false
    end
  end
end
