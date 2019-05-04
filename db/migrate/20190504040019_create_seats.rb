class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.references :bus, foreign_key: true
      t.integer :seat_number
      t.timestamps
    end
  end
end
