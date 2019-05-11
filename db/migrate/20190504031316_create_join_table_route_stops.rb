class CreateJoinTableRouteStops < ActiveRecord::Migration[5.2]
  def change
    create_table :routes_stops do |t|
      t.references :route, foreign_key: true
      t.references :stop, foreign_key: true
      t.datetime :hour_of_arriving
    end
  end
end
