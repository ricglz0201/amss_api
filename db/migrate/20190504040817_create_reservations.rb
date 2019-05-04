class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :users, foreign_key: true
      t.references :stops, foreign_key: true
      t.boolean :bike_seat_reserved
      t.timestamps
    end
  end
end
