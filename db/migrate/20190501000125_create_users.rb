class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :uid
      t.string :mail
      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
