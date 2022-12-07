class CreateTurbines < ActiveRecord::Migration[7.0]
  def change
    create_table :turbines do |t|
      t.timestamps
      t.string :name
      t.float :maximum_power
      t.float :max_wind_speed
      t.float :min_wind_speed
      t.integer :blades
      t.float :tower_height
      t.float :rotor_diameter
      t.string :description
    end

    add_index :turbines, :name
    add_index :turbines, :maximum_power
  end
end
