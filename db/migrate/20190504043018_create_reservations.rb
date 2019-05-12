class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :stop, foreign_key: true
      t.references :trip, foreign_key: true
      t.boolean :bike_seat_reserved
      t.timestamps
    end
  end
end
