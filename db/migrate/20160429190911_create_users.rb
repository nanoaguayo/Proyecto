class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :lastname
      t.string :mail
      t.integer :admin
      t.integer :blocked
      t.string :salt

      t.timestamps null: false
    end
  end
end
