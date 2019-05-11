class CreateJoinTableBusRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :buses_routes do |t|
      t.references :bus, foreign_key: true
      t.references :route, foreign_key: true
    end
  end
end
