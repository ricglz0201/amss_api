class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.integer :bycicles_slots_available
      t.integer :seats_available
      t.timestamps
    end
  end
end
