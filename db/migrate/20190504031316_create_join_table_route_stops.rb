class CreateJoinTableRouteStops < ActiveRecord::Migration[5.2]
  def change
    create_table :route_stops do |t|
      t.references :routes, foreign_key: true
      t.references :stops, foreign_key: true
      t.datetime :hour_of_arriving
    end
  end
end
