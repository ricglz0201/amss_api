class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :seat, foreign_key: true
      t.datetime :date
      t.timestamps
    end
  end
end
