class CreateJoinTableBusRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_routes do |t|
      t.references :buses, foreign_key: true
      t.references :rotues, foreign_key: true
    end
  end
end
